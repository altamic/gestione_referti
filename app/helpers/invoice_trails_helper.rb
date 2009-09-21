module InvoiceTrailsHelper
  def inflect_result(number)
    return :results unless number == 1
    :result
  end
  
  def class_color(revenue)
    revenue < 0 ? "red" : "green"
  end
  
  def italian_calendar_date_select
    %w(calendar_date_select/calendar_date_select.js calendar_date_select/locale/it.js calendar_date_select/format_italian.js)
  end
end
