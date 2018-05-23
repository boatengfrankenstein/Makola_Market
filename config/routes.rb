Rails.application.routes.draw do
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :categories
 resources :classifieds
 root 'classifieds#index'

 
 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  
end
