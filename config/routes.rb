Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :user_cities, only: [:new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  resources :tips do
    resources :reports, only: [:new, :create]
    resources :votes, only: [:new, :create, :destroy]
  end
  resources :questions, only: [:new, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
