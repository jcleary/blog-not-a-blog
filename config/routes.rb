Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#home'

  resources :users, param: :username do
    resources :artifacts, param: :slug
    resources :collections, param: :slug
  end
end
