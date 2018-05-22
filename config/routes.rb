Rails.application.routes.draw do
  resources :categories
  resources :classifieds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :site
resources :dashboard
get :search, controller: :classifieds
 get 'site#index', to: 'site#index' 
 root  'classifieds#index'
  get 'dashboard', to: 'dashboard#index', as: :dashboard_index_path
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
end
