Rails.application.routes.draw do
  get 'books/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :authors
  resources :book_authors

  root 'books#index'
end
