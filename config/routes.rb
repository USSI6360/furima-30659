Rails.application.routes.draw do
  get 'articles/new'
  devise_for :users
  root to: "items#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:create, :index, :edit, :update, :new, :show] do
    resources :items, only: [:index, :create]
  end
  resources :burden,:category,:day,:prefecture,:status
end
