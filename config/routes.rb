Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products do
    collection do
      get :import_form
      post :import
    end
     post :add_to_cart, on: :member
  end

  resources :cart, only: :index do
    collection do
      delete '/delete_item/:product_id', to: 'cart#delete_item', as: 'delete_item'
      post :order
    end
  end

  resources :users, only: :index

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :products, only: %i(index show create) do
        patch :update_price, on: :member
      end
    end
  end
end
