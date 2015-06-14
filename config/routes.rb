require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'}, constraints: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      #user
      post 'users/sign_up(.:format)', to: 'users#sign_up'
      get 'users/profile(.:format)', to: 'users#profile'

      #session
      post 'sessions/login(.:format)', to: 'sessions#create'
      post 'sessions/logout(.:format)', to: 'sessions#destroy'
    end
  end
end
