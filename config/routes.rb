require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'}, constraints: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      #user
      post 'users/sign_up(.:format)', to: 'users#sign_up'
      get 'users/:user_id/profile(.:format)', to: 'users#profile'
      post 'users/search(.:format)', to: 'users#search'

      #session
      post 'sessions/login(.:format)', to: 'sessions#create'
      post 'sessions/logout(.:format)', to: 'sessions#destroy'

      #team
      post 'teams/create(.:format)', to: 'teams#create'
      get 'teams/:team_id/info(.:format)', to: 'teams#info'
      post 'teams/:team_id/switch_role(.:format)', to: 'teams#switch_role'
    end
  end
end
