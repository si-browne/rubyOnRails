Rails.application.routes.draw do
  resources :users
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  resources :books
  resources :authors
  resources :publishers
  resources :genres
  resources :novels do
    collection do
    get :search
    end
  end
  resources :sessions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end