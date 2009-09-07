class InvoiceTrail < ActiveRecord::Base
  has_one :client
  # TODO: define 
  # partial_sum
  # partial_gross_total
  # partial_discount
  
  # delegate 
  
  def full_name
    [last_name, first_name].join(' ')
  end
end
