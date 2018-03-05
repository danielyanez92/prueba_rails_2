Rails.application.routes.draw do
  devise_for :users
  root 'todos#index'
  resources :todos, only: [:index, :show, :edit, :new] do
    resources :completes, only: [:create, :destroy]
  end
  resources :completes, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
