require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'}, constraints: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      #user
      post 'users/sign_up(.:format)', to: 'users#sign_up'
      get 'users/:user_id/profile(.:format)', to: 'users#profile'
      post 'users/search(.:format)', to: 'users#search'

      #session
      post 'sessions/sign_in(.:format)', to: 'sessions#create'
      delete 'sessions/:token(.:format)', to: 'sessions#destroy'

      #Team
      post 'teams/confirm_invite(.:format)' => 'teams#confirm_invite'
      post 'teams/confirm_team(.:format)' => 'teams#confirm_team'

      scope ('teams/:team_id'), team_id: /\d+/ do
        get '/info(.:format)' => 'teams#info', as: :team_info
        post '/invite(.:format)' => 'teams#invite', as: :team_invite
        post '/companies/search(.:format)' => 'companies#search'
        post '/companies/import(.:format)' => 'companies#import'
        get '/companies/:company_id(.:format)' => 'companies#show'
        get '/companies/user_companies(.:format)' => 'companies#user_companies'
        get '/companies/team_companies(.:format)' => 'companies#team_companies'
        get '/signals' => 'signals#index'
        get '/signals/industries(.:format)' => 'signals#industries'
        get '/signals/districts(.:format)' => 'signals#districts'
        post '/signals/search_industry(.:format)' => 'signals#search_industry'
        post '/signals/search_district(.:format)' => 'signals#search_district'

        #Prospects
        get '/prospects/user_prospects(.:format)' => 'prospects#user_prospects'
        get '/prospects/team_prospects(.:format)' => 'prospects#team_prospects'
        get '/companies/:company_id/prospects(.:format)' => 'prospects#company_prospects'
        get '/prospects/:prospect_id(.:format)' => 'prospects#show'
        post '/companies/:company_id/prospects/:prospect_id(.:format)' => 'prospects#import'
      end
    end
  end
end
