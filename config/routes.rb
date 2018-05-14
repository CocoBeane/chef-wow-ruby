Rails.application.routes.draw do
  get 'ingredients/new'
  post 'ingredients/create'
  get 'ingredients' => 'ingredients#index', as: :ingredients
  get '/ingredients/:id', to: 'ingredients#show', as: :ingredient
  get '/ingredients/:id/edit', to: 'ingredients#edit'
  patch '/ingredients/:id/update', to: 'ingredients#update'

  get 'recipes/new'
  post 'recipes/create'
  get 'recipes' => 'recipes#index', as: :recipes
  get '/recipes/:id', to: 'recipes#show', as: :recipe
end
