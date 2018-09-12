Rails.application.routes.draw do
  get "categories/index"

  # root "home#index"
  get "/",           to: "home#index"
  get "/categories", to: "categories#index"
end
