# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :articles
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
