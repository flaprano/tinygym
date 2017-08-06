Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [] do
    resources :gyms, only: [:new, :create]
  end

  resources :gyms, only: [:index, :show] do
    patch 'approve', on: :member
  end
end
