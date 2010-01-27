RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "calendar_date_select", :version => '~> 1.15'
  config.gem "searchlogic", :version => '~> 2.3.5'
  config.gem "will_paginate", :version  => '~> 2.3.0'
  config.gem "calendar_date_select", :version  => '1.15'
  
  config.time_zone = 'Rome'
  config.i18n.default_locale = :it
end