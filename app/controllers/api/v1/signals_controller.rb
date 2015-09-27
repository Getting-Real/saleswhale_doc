class Api::V1::SignalsController < ApplicationController
  swagger_controller :signals, 'Signal Management'

  swagger_api :index do
    summary 'Return list of all signals - industries, districts'
    response :ok
  end

  swagger_api :industries do
    summary 'Return list of all industries'
    response :ok
  end

  swagger_api :districts do
    summary 'Return list of all districts'
    response :ok
  end

  swagger_api :search_industry do
    summary 'Search industry by name'
    response :bad_request
    response :ok
  end

  swagger_api :search_district do
    summary 'Search district by name'
    response :bad_request
    response :ok
  end

  add_authentication_params [:index, :industries, :districts, :search_industry, :search_district]
end
