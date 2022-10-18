Rails.application.routes.draw do
  post 'rooms/join' => 'rooms#join'
  post 'rooms/:room_id/leave' => 'rooms#leave'
  get 'rooms/:room_id/active_users' => 'rooms#active_users'

  get 'rooms/:room_id/messages(/page/:page)' => 'messages#index'
  post 'rooms/:room_id/messages' => 'messages#create'
  # resources :scaffold_tests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
