Rails.application.routes.draw do
  root to: 'divisions#index'
    resources :divisions do
      resources :employees
      resources :projects
  end
end
