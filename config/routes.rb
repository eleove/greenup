Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :locations do
    resources :events, only: [:new, :create]
  end
  resources :events, only: [:index, :show, :edit, :update, :destroy] do
    resources :event_participants, only: [:create, :destroy]
  end
end
