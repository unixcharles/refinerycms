ActionController::Routing::Routes.draw do |map|

  map.resources :resources

  map.namespace(:admin, :path_prefix => APP_CONFIG['admin_prefix']) do |admin|
    admin.resources :resources, :collection => {:insert => :get}
  end

end
