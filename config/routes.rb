# config/routes.rb
Rails.application.routes.draw do
  resources :products do
    resources :items
  end
end
