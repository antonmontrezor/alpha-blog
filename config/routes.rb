# frozen_string_literal: true

Rails
  .application
  .routes
  .draw do
    root 'pages#home'
    get 'about', to: 'pages#about'

    # Provides REST-ful routes to Rails resources (like articles)
    resources :articles
    # , only: [:show, :index, :new, :create, :edit, :update] # to keep only route for the listed action
    get 'signup', to: 'users#new'
    resources :users, except: [:new]
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    resources :categories, except: [:destroy]
  end
