Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/top'

  root to: 'rooms#index'
  get 'rooms/index'
  resources :rooms
  get 'search', to: 'rooms#search'

  resources :reservations
  get 'reservations/index'
  post 'reservations/confirm'
  get 'users/profile', to: 'users#show'
  # get "/users/profile/edit" , to: "users#profile_edit"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
