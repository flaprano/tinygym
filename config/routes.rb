Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [] do
    resources :gyms, only: [:new, :create, :show, :index]
  end

  resources :gyms, only: [:index]# do
    #get 'filtered', on: :collection
  #end
end
