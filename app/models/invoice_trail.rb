class InvoiceTrail < ActiveRecord::Base
  has_one :client
  
  validates_presence_of :last_name, :first_name, :admission_date, :admission_code, :gross_amount
  # TODO: define 
  # partial_sum
  # partial_gross_total
  # partial_discount
  
  # delegate 
  
  named_scope :payment_completed, :conditions => ['payed = ?', true]
  named_scope :payment_uncompleted, :conditions => ['payed = ?', false]
  
  named_scope :payment_status, lambda { |value| self.send(:compute_conditions, value) }
  
  def payment_status
    payed ? "payment_completed" : "payment_uncompleted"
  end
    
  def full_name
    [last_name, first_name].join(' ')
  end

  def payment_status_description
    # in attesa di pagamento da x giorni
    # ha pagato x euro con uno sconto del x% 
    # se giorni > 15, in x giorni
  end

  private
  def self.compute_conditions(value)
    self.send(value).proxy_options
  end
end
