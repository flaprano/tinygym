Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [] do
    resources :gyms, only: [:new, :create]
  end

  get 'my_gyms', to: 'gyms#my_gyms'
  resources :gyms, only: [:index, :show, :destroy] do
    get 'disapproved', on: :collection
    patch 'approve', on: :member
  end

  resources :daily_tokens, only: [:create, :show]
end
