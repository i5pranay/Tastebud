Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'navigations#home'

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




end
