Rails.application.routes.draw do
  devise_for :users
  root to: 'divisions#index'
    resources :divisions do
      resources :employees
      resources :projects
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
