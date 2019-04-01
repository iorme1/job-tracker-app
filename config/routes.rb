Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :invitations
  root 'companies#index'

end
