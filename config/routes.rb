Rails.application.routes.draw do
  root "pages#index"

  resources :astronauts do
    collection do
      get :new_xml_import
      post :parse_xml
    end
  end

  resources :pages do
    collection do
      post :send_feedback
    end
  end
end
