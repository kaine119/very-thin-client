Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources "counter", only: [:index, :new, :update, :destroy]
  # get "/counter/:id/:count", to: "counter#update"
  root "counter#index"
end
