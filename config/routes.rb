Rails.application.routes.draw do
  get 'ingredients/new'
  post 'ingredients/create'
  get 'ingredients' => 'ingredients#index', as: :ingredients
end
