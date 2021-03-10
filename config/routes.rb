Rails.application.routes.draw do
  root "pages#index"

  resources :astronauts

  resources :pages do
    collection do
      post :send_feedback
    end
  end
end
