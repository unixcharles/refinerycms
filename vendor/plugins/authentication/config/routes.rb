ActionController::Routing::Routes.draw do |map|

  map.resource :session
  map.resources :users, :only => [:new, :create], :collection => {:forgot => :get, :reset => :get}
  map.reset_users '/users/reset/:reset_code', :controller => 'users', :action => 'reset'

  map.namespace(:admin, :path_prefix => APP_CONFIG['admin_prefix']) do |admin|
    admin.resources :users, :collection => {:update_positions => :post}
  end

  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

end
