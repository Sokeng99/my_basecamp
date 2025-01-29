Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :show, :destroy, :edit, :update ]

  resources :projects do
    member do
      patch :toggle_admin
      post :add_member
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get "/projects", to: "projects#index", as: :projects_home
  get "/signup", to: "users#new"
  root "sessions#new"
end
