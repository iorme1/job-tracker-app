Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :invitations
  resources :shares, path_names: {new: 'new/:invite_id'}
  root 'companies#index'
  get 'companies/shared_index/:id', to: 'companies#shared_index', :as => :company_shared_index
  get 'companies/shared_show/:id', to: 'companies#shared_show', :as => :company_shared_show
end
