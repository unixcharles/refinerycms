ActionController::Routing::Routes.draw do |map|
  map.wymiframe '/wymiframe/:id', :controller => "application", :action => "wymiframe"

  map.namespace(:admin, :path_prefix => APP_CONFIG['admin_prefix']) do |admin|
    admin.resources :refinery_core
  end

  map.connect "/#{APP_CONFIG['admin_prefix']}/flash", :controller => "admin/refinery_core", :action => "render_flash_messages"
  map.connect "/#{APP_CONFIG['admin_prefix']}/update_menu_positions", :controller => "admin/refinery_core", :action => "update_plugin_positions"
end
