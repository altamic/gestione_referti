module InvoiceTrailsHelper
  def inflect_result(number)
    return :results unless number == 1
    :result
  end
end
