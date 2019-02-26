Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users
  get 'locations/zoom', to: "locations#zoom"
  resources :locations, except: [:show] do
    resources :events, only: [:new, :create]
  end
  get 'locations/:id', to: "locations#show"
  resources :events, only: [:index, :show, :edit, :update, :destroy]

end
