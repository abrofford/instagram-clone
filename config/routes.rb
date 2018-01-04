Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update]
  resources :photos, only: [:new, :create, :index, :show] do
    put "like", to: "photos#like"
    put "dislike", to: "photos#dislike"
  end
  resource :sessions, only: [:new, :create, :destroy]
  resources :comments, only: [:create]

  namespace :api, constraints: {format: "json"} do
    resources :photos, only: [:show, :index]
  end
end
