# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def breadcrumbs(page_breadcrumbs, show_breadcrumbs = true)
    @content_for_breadcrumbs = page_breadcrumbs.to_s
    @show_breadcrumbs = show_breadcrumbs
  end
  
  def show_breadcrumbs?
    @show_breadcrumbs
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end
  
  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }.push({:cache  => true})
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def italian_calendar_date_select
    %w(calendar_date_select/calendar_date_select.js calendar_date_select/locale/it.js calendar_date_select/format_italian.js)
  end
  
  def cancel_link
    link_to  t('cancel'), url_for(:back), {:class => 'command'}
  end
end
