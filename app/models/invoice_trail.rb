class InvoiceTrail < ActiveRecord::Base
  validates_presence_of :full_name, :admission_date, :admission_code, :gross_amount
  # TODO: define 
  # partial_sum
  # partial_gross_total
  # partial_discount

  named_scope :any_payment, :conditions => {}
  
  named_scope :payment_uncompleted, :conditions => { :payed => false }
              
  named_scope :payment_completed, :conditions => { :payed => true }
              # :conditions => ["payed = ? AND invoice_number IS NOT ?", true, nil]
              
  # named_scope :payment_completed_without_invoice_number, 
  #              :conditions => { :payed => true, :invoice_number => nil }

  named_scope :payment_status, lambda { |value| self.send(:compute_conditions, value) }
  
  # default_value_for :payed, false
  
  before_save :assign_discount
  
  def payment_status
    payed ? "payment_completed" : "payment_uncompleted"
  end

  def payment_status_description

    # se payed e' trusin attesa di pagamento da x giorni
    # ha pagato x euro con uno sconto del x% 
    # se giorni > 15, in x giorni
  end

  private
  def self.compute_conditions(value)
    self.send(value).proxy_options
  end
  
  def compute_discount
    return [0.0, (1 - (payed_amount / gross_amount))*100].max if payed_amount > 0.0
    0.0
  end

  def assign_discount
    discount = compute_discount
  end
  

end
