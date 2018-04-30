Rails.application.routes.draw do
  get 'ingredients/new'
  post 'ingredients/create'
  get 'ingredients' => 'ingredients#index', as: :ingredients
  get '/ingredients/:id', to: 'ingredients#show'

  get 'recipes/new'
  post 'recipes/create'
  get 'recipes' => 'recipes#index', as: :recipes
  get '/recipes/:id', to: 'recipes#show'
end
