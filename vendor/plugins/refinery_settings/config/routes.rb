ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin, :path_prefix => APP_CONFIG['admin_prefix']) do |admin|
    admin.resources :refinery_settings, :as => :settings
  end
end
