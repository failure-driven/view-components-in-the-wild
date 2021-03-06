Rails.application.routes.draw do
  resources :v3_users
  resources :users
  resources :v2_users
  resource :demo, only: %i[show] do
    member do
      get :plain_old_rails
    end
  end
  resources :presentations, only: %i[index]

  root 'home#index'
end
