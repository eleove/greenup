Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users
  resources :locations do
    resources :events, only: [:new, :create]
  end
  resources :events, only: [:index, :show, :edit, :update, :destroy]

end
