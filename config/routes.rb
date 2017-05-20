Rails.application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :projects, path: 'work', only: [:index, :show]
  resources :services, only: [:index, :show]
  resources :technologies, only: [:index, :show]
  resources :contacts, only: [:new, :create]
  resources :subscriptions, only: [:create] do
    collection do
      get :thanks
    end
  end

  get '/ruby-on-rails', to: 'landings#ruby'
  get '/san-jose', to: 'landings#san_jose'

  root to: 'homes#show'
end
