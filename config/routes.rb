Rails.application.routes.draw do
  root "astronauts#index"

  get "/astronauts", to: "astronauts#index"
  get "/test", to: "astronauts#test"
end
