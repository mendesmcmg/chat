Rails.application.routes.draw do
  get 'messages/index'
  post 'rooms/join' => 'rooms#join'
  get 'rooms/:room_id/messages' => 'messages#index'
  # resources :scaffold_tests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
