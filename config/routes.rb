Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users
  scope '/patient', as: 'patient' do
    get '/profile', to: 'patients#show'
  end

  scope '/doctor', as: 'doctor' do
    get '/profile', to: 'doctors#show'
  end

  resources :doctors
  resources :appointments
end
