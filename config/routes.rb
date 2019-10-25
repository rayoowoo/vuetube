Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do 
    resources :users, only: [:create, :show, :index, :update]

    resource :session, only: [:create, :destroy]

    resources :videos, only: [:index, :show, :create, :destroy, :update]
  end

  root to: 'static_pages#root'
end
