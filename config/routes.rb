DataEngineering::Application.routes.draw do
  resources :customers_products

  resources :products

  resources :merchants

  resources :customers

  get  'legacy_import' => 'root#legacy_import'
  post 'legacy_import' => 'root#legacy_import_submit'

  root to: 'root#index'
end
