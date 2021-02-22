Rails.application.routes.draw do
  resources :users
  resource :demo, only: %i[show] do
    member do
      get :plain_old_rails
    end
  end

  root 'home#index'
end
