Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products do
    collection do
      get :import_form
      post :import
    end
  end
end
