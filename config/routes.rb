Rails.application.routes.draw do
  get 'notifications/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'navigations#home'

  #friendship routes
  #resources :friendships
  match "my_friends" => "friendships#index", :via => 'get',:as => "myfriends"
  #match 'add_friend/:friend_id' => 'friendships#create', :via => 'post', :as => 'addfriend'
  post 'add_friend', to: 'friendships#create'
  match 'current_user_friends' => 'friendships#show', :via => 'get', :as => 'myfriendslist'
  match 'remove_friend' => 'friendships#destroy', :via => 'delete' ,:as => "removefriend"



  #myprofile
  match "my_profile" => "admins#show_my_profile", :via => 'get',:as => "myprofile"


  #routes for category of food
  match "new_category" => "admins#new_category_view", :via => 'get',:as => "new_category"
  match "create_category" => "admins#create_category", :via => 'post',:as => "create_category"
  match "edit_category" => "admins#edit_category_view", :via => 'get', :as => "edit_category"
  match "update_category" => "admins#update_category", :via => 'post', :as => "update_category"
  match "delete_category" => "admins#destroy_category", :via => 'delete'


  #navigations
  #routes to add dish
  match "new_recipe" => "navigations#new_recipe_view", :via => 'get', :as => "new_recipe"
  match "create_recipe" => "navigations#create_recipe", :via => 'post', :as => "create_recipe"
  match "show_recipe/:recipe_id" => "navigations#show_recipe", :via => 'get', :as => 'show_recipe'
  match "edit_recipe/:recipe_id" => "navigations#edit_recipe", :via => 'get' , :as =>  "form_edit_recipe"
  match "update_recipe" => "navigations#update_recipe", :via => 'post', :as =>  "edit_recipe_y"
  match "delete_recipe/:recipe_id" => "navigations#destroy_recipe", :via => 'delete', :as => "delete_recipe"
  match "list_my_recipe" => "navigations#list_my_recipe", :via => 'get', :as => "list_recipe"
  match "rate_recipe" => "navigations#rate_recipe", :via => 'post'
  match "list_all_recipe" => "navigations#list_all_recipe", :via => 'get', :as => "list_all_recipe"
  #routes for about us
  match "about_us" => "admins#about_us", :via => 'get'

  #facebook omniouth

  #notifications

  resources :notifications do 
    collection do
      post :mark_as_read
    end
  end
  




end
