load(RAILS_ROOT + '/lib/default_value_for_plugin.rb')
ActiveRecord::Base.extend(DefaultValueForPlugin::ClassMethods)
