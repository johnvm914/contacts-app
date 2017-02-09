Rails.application.routes.draw do
  get "/contacts/new", to: "contacts#new"
  get "/contacts/:id", to: "contacts#show"
  get "/contacts", to: "contacts#index"
  get "/contacts/:id/edit", to: "contacts#edit"
  patch "/contacts/:id", to: "contacts#update"
  delete "/contacts/:id", to: "contacts#destroy"
  post "/contacts", to: "contacts#create"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

end

