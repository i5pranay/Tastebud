Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'navigations#home'

  #routes for category of food
  match "new_category" => "admins#new_category_view", :via => 'get',:as => "new_category"
  match "create_category" => "admins#create_category", :via => 'post',:as => "create_category"

  #navigations
  #routes to add dish
  match "new_recipe" => "navigations#new_recipe_view", :via => 'get', :as => "new_recipe"
  match "create_recipe" => "navigations#create_recipe", :via => 'post', :as => "create_recipe"




end
