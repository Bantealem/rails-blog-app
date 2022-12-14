Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show] do
  resources :likes
  resources :comments
end
