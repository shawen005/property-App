Rails.application.routes.draw do
  
  resources :listing_images
  resources :listings
  resources :dashboards
  resources :topics, only: [:index, :show]
  resources :comments
  resources :filters
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
  put :sort, on: :collection

  end


  get 'rent', to: 'listings#rent'
  get 'buy', to: 'listings#buy'
  get 'property', to: 'listings#property'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'agents/:id', to: 'users#show', as: 'user_show'
  get 'about-me', to: 'pages#about'
  get 'agent', to: 'users#agent'
  get 'agency', to: 'users#agency'
  get 'contact_us', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  get 'dashboards', to: 'dashboard#index'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
   mount ActionCable.server => '/cable'
  root  to: 'pages#home' , as: 'home'
end