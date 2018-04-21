# config/routes.rb
Rails.application.routes.draw do
  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ::ApiVersion.new('v1', true) do
    resources :products do
      resources :items
    end
  end
end
