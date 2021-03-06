Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'pages/home', to: 'pages#home'         #localhost:3000/pages/home
  #get 'pages/about', to: 'pages#about'       #localhsot:3000/pages/about
  #localhost:3000 or localhost:3000/about
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
  # add signup
  get 'signup', to: 'users#new'
  resources :users, except: [:new]   #create route except for signup

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
