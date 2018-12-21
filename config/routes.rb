Rails.application.routes.draw do
  get 'categories/new'
  get "categories/index"

  # root "home#index"
  get "/",           to: "home#index"
  get "/categories", to: "categories#index"

  post "categories/create"
end
