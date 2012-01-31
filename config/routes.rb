Storemanager::Application.routes.draw do
 
 # match 'auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 
  get 'tag/:id' => 'stores#tag', :as => :tag_list
  
  get 'show_tags' => 'stores#show_tags'
  
  get 'tag_cloud' => 'stores#tag_cloud'
  
  resources :stores
  root :to => "facebook#canvas"

  
end
