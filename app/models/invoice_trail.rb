class InvoiceTrail < ActiveRecord::Base
  has_one :client
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


  private
  def self.compute_conditions(value)
    self.send(value).proxy_options
  end
end
