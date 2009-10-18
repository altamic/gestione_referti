module InvoiceTrailsHelper
  def inflect_result(number)
    return :results unless number == 1
    :result
  end
  
  def class_color(revenue)
    revenue < 0 ? "red" : "green"
  end
  
end
