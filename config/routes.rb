Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
  scope module: :api do
    scope module: :v1, constraints: ApiVersionConstraint.new(version: 1) do
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      delete 'sessions', to: 'sessions#destroy'
    end
  end
end
