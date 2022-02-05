Rails.application.routes.draw do
  resources :chapters
  post '/chapters/create_and_return_new_book', to: 'chapters#create_and_return_new_book'
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
