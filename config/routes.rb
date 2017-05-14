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
  get '*username/tags', to: 'tags#index', as: 'short_user_tags'
  get '*username/tags/*tag', to: 'tags#show', as: 'short_user_tag'
  get '*username/collections', to: 'collections#index', as: 'short_user_collections'
  get '*username/collections/*slug', to: 'collections#show', as: 'short_user_collection'
  get '*username/artifacts', to: 'artifacts#index', as: 'short_user_artifacts'
  get '*username/*slug', to: 'artifacts#show', as: 'short_user_artifact'
  get '*username', to: 'users#show', as: 'short_user' 
end
