Rails.application.routes.draw do
  root :to => 'static_pages#home'
  get 'static_pages/home'

  get  '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users

  get 'ingredients' => 'ingredients#index', as: :ingredients
  get 'ingredients/new'
  post 'ingredients/create'
  get '/ingredients/:id', to: 'ingredients#show', as: :ingredient
  get '/ingredients/:id/edit', to: 'ingredients#edit'
  patch '/ingredients/:id/update', to: 'ingredients#update'
  delete '/ingredients/:id', to: 'ingredients#destroy'

  get 'recipes' => 'recipes#index', as: :recipes
  get 'recipes/new'
  post 'recipes/create'
  get '/recipes/:id', to: 'recipes#show', as: :recipe
  get '/recipes/:id/edit', to: 'recipes#edit'
  patch '/recipes/:id/update', to: 'recipes#update'
  delete '/recipes/:id', to: 'recipes#destroy'
end