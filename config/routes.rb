Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do 
    resources :users, only: [:create, :show, :index, :update]
  end

  root to: 'static_pages#root'
end
