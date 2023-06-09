Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#index'

  devise_for :users
  scope '/patient', as: 'patient' do
    get '/profile', to: 'patients#show'
  end

  resources :doctors, only: [:index, :show]
  resources :patients, only: [:show]
  resources :appointments, only: [:index, :create, :update]
end
