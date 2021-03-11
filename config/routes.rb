Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

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
