Storemanager::Application.routes.draw do
  devise_for :users
 
  get 'tag/:id' => 'stores#tag', :as => :tag_list
  
  get 'show_tags' => 'stores#show_tags'
  
  get 'tag_cloud' => 'stores#tag_cloud'
  
  resources :stores
  root :to => "stores#index"

  
end
