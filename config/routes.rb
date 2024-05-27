Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'rooms#index'
  resources :rooms
  get 'search' => 'rooms#search'
end
