Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#home'

  resources :users, param: :username, only: [:show] do
    resources :artifacts, param: :slug
    resources :collections, param: :slug
  end

  # short routes
  #  - /username
  #  - /username/artifact-slug
  #  - /username/collections/collection-slug
  #  - /username/tags/tag
  get '*user_username/tags', to: 'tags#index', as: 'short_user_tags'
  get '*user_username/tags/*tag', to: 'tags#show', as: 'short_user_tag'
  get '*user_username/collections', to: 'collections#index', as: 'short_user_collections'
  get '*user_username/collections/*slug', to: 'collections#show', as: 'short_user_collection'
  get '*user_username/artifacts', to: 'artifacts#index', as: 'short_user_artifacts'
  get '*user_username/*slug', to: 'artifacts#show', as: 'short_user_artifact'
  get '*username', to: 'users#show', as: 'short_user' 
end
