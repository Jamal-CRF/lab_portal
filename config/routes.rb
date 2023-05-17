Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: "registrations"
  }
  resources :exames, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  
  root "exames#index"
end
