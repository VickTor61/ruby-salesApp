Rails.application.routes.draw do
  devise_for :users
  resources :campaigns

  namespace :admin do
    resources :users
  end

  root to: 'sales#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
