DataEngineering::Application.routes.draw do
  resources :customers_products

  resources :products

  resources :merchants

  resources :customers

end
