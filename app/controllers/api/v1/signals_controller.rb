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

  def index
    render json: Oj.dump(
      {"industries"=>
       [{
         "name"=>"industry_1",
         "eComponentId"=>"industry_21"
       },
       {
         "name"=>"industry_2",
         "eComponentId"=>"industry_22"
       }],
       "districts"=>
       [{
         "name"=>"Raffles Place, Cecil, Marina, People's Park",
         "eComponentId"=>"district_1"
       },
       {
         "name"=>"Anson, Tanjong Pagar",
        "eComponentId"=>"district_2"
       },
       {
         "name"=>"Telok Blangah, Harbourfront",
         "eComponentId"=>"district_3"
       }]
    }), status: :ok
  end

  def industries
    render json: Oj.dump(
       [{
         "name"=>"industry_1",
         "eComponentId"=>"industry_21"
       },
       {
         "name"=>"industry_2",
         "eComponentId"=>"industry_22"
       }]
    ), status: :ok
  end

  def districts
    render json: Oj.dump(
       [{
         "name"=>"Raffles Place, Cecil, Marina, People's Park",
         "eComponentId"=>"district_1"
       },
       {
         "name"=>"Anson, Tanjong Pagar",
        "eComponentId"=>"district_2"
       },
       {
         "name"=>"Telok Blangah, Harbourfront",
         "eComponentId"=>"district_3"
       }]
    ), status: :ok
  end

  def search_industry
    render json: Oj.dump(
       [{
         "name"=>"industry_1",
         "eComponentId"=>"industry_21"
       },
       {
         "name"=>"industry_2",
         "eComponentId"=>"industry_22"
       }]
    ), status: :ok
  end

  def search_ditrict
    render json: Oj.dump(
       [{
         "name"=>"Raffles Place, Cecil, Marina, People's Park",
         "eComponentId"=>"district_1"
       },
       {
         "name"=>"Anson, Tanjong Pagar",
        "eComponentId"=>"district_2"
       },
       {
         "name"=>"Telok Blangah, Harbourfront",
         "eComponentId"=>"district_3"
       }]
    ), status: :ok
  end

  add_authentication_params [:index, :industries, :districts, :search_industry, :search_district]
end
