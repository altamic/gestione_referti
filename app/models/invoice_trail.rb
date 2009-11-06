class InvoiceTrail < ActiveRecord::Base
  validates_presence_of :full_name, :admission_date, :admission_code, :gross_amount, :discounted_amount
  validates_uniqueness_of :admission_code, :scope => :admission_date, :on => :create, 
                          :message => " deve essere univoco in un dato giorno. Ne esiste un'altra uguale."
  validates_length_of :invoice_number, :is => 0, :allow_blank => true, :if => Proc.new {|u| not u.payed } , :message => "Non puoi avere una fattura senza che ci sia stato un pagamento"
  
  named_scope :any_payment, :conditions => {}
  named_scope :payment_uncompleted, :conditions => { :payed => false }
  named_scope :payment_completed, :conditions => ["payed = ? AND invoice_number IS NOT ?", true, nil]
              
  # named_scope :payment_completed_without_invoice_number, 
  #              :conditions => { :payed => true, :invoice_number => nil }
  
  named_scope :payment_status, lambda { |value| self.send(:compute_conditions, value) }
  
  default_value_for :admission_code do
    InvoiceTrail.compute_next_admission_code
  end 
  default_value_for :gross_amount, 43.50
  default_value_for :discounted_amount, 43.50
  default_value_for :payed, false
  
  before_save :assign_discount, :remove_payment_date_when_unpayed
  
  def payment_status
    payed ? "payment_completed" : "payment_uncompleted"
  end

  def payment_status_description
    # se payed e' true se in attesa di pagamento da x giorni
    # ha pagato x euro con uno sconto del x% 
    # se giorni > 15, in x giorni
  end
  
  SEARCH_CRITERIA = [
    :admission_date_after,
    :admission_date_before,
    :payment_status,
    :invoice_number, 
    :admission_code_like,
    :full_name_like,
    :notes_like
  ]
  
  private
  def self.compute_next_admission_code
    number = InvoiceTrail.count(:conditions => {:admission_date => Time.now.to_date.to_s(:db)}) + 1
    day    = Time.now.day
    "#{day.to_s.rjust(2,'0')}#{number.to_s.rjust(3,'0')}"
  end
  
  def self.compute_conditions(value)
    self.send(value).proxy_options
  end
  
  def compute_discount
    (100 * [0.0, (1 - (discounted_amount / gross_amount))].max) if discounted_amount > 0.0
  end

  def assign_discount
    self.discount = compute_discount
    true
  end
  
  def remove_payment_date_when_unpayed
    payment_date = '' if not payed
    true
  end
  

end
