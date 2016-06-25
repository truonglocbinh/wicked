Rails.application.routes.draw do
  resources :products, only: [:new, :create, :index, :destroy] do
    resources :steps, only: [:show, :update], controller: 'product/steps'
  end

  root to: 'products#index'
end
