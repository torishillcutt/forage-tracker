Rails.application.routes.draw do
  resources :items
  resources :users
  resources :expeditions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
