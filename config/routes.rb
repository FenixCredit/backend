Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
  scope module: :api do
    scope module: :v1, constraints: ApiVersionConstraint.new(version: 1) do
      resources :sessions, only: [:create]
      delete 'sessions', to: 'sessions#destroy'

      scope module: :dashboard, constraints: ApiPlatformConstraint.new(platform: 'dashboard') do
        resources :admins, only: [:create, :index]
        get 'profile', to: 'admins#profile'
      end
    end
  end
end
