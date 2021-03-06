Rails.application.routes.draw do
  post '/guest', to: 'guest_sessions#create'
  get 'categories/index'
  get 'categories/edit'
  root 'static_pages#home'
  get 'sessions/new'
  get  '/help', to: 'static_pages#help'
  get  '/about' ,to: 'static_pages#about'
  get  '/home', to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete'/logout',  to: 'sessions#destroy'
  resources :users
  resources :memos
  resources :categories, except: [:new, :show]
end
