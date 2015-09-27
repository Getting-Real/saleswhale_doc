class Api::V1::CompaniesController < ApplicationController
  swagger_controller :companies, 'API for searching/importing companies'

  swagger_api :search do
    summary 'Return count of matched results (summary) or infos of all matched results'
    param :query, :industry, :string, :optional, 'List of industries ids separated by comma'
    param :query, :district, :string, :optional, 'List of districts ids separated by comma'
    param :query, :has_facebook, :boolean, :optional
    param :query, :has_website, :boolean, :optional
    param :query, :has_branches, :boolean, :optional
    param :query, :summary, :boolean, :optional, 'if summary is true, only return count for matched results instead of full info', defaultValue: false
    response :unauthorized
    response :bad_request
    response :ok
  end

  swagger_api :import do
    summary 'Import subset of companies from search result'
    param :query, :industry, :string, :optional, 'List of industries ids separated by comma'
    param :query, :district, :string, :optional, 'List of districts ids separated by comma'
    param :query, :has_facebook, :boolean, :optional
    param :query, :has_website, :boolean, :optional
    param :query, :has_branches, :boolean, :optional
    param :query, :record_to_import, :integer, :required, 'Number of records to import'
    response :unauthorized
    response :unprocessable_entity
    response :ok
  end

  swagger_api :show do
    summary 'Show detailed info of company'
    param :path, :company_id, :string, :required
    response :unauthorized
    response :not_found
    response :ok
  end

  swagger_api :user_companies do
    summary 'Show list of companies imported by user'
    response :unauthorized
    response :ok
  end

  swagger_api :team_companies do
    summary 'Show list of companies imported by team - only owner can see'
    response :unauthorized
    response :ok
  end

  def search
    if params[:summary].present? && params[:summary].to_bool
      render json: Oj.dump({"result_count"=>3}), status: :ok
    else
      render json: Oj.dump(
        {"companies"=>[
          {"name"=>"Moen LLC_4",
           "description"=>nil,
           "branches"=>[],
           "industry"=>"industry_4"
          },
          {"name"=>"Huel-Christiansen_5",
           "description"=>nil,
           "branches"=>[],
           "industry"=>"industry_5"
          },
          {"name"=>"Schaden Group_6",
           "description"=>nil,
           "branches"=>[],
           "industry"=>"industry_6"
          }],
          "page"=>1,
          "total_pages"=>1,
          "total_entries"=>3}
      ), status: :ok
    end
  end

  def import
    render nothing: true, status: :created
  end

  def show
    render json: Oj.dump(
      {"name"=>"Huel-Christiansen_5",
       "description"=>nil,
       "branches"=>[],
       "industry"=>"industry_5"
      }
    ), status: :ok
  end

  def user_companies
    render json: Oj.dump(
      {"companies"=>[
        {"name"=>"Moen LLC_4",
         "description"=>nil,
         "branches"=>[],
         "industry"=>"industry_4"
        },
        {"name"=>"Huel-Christiansen_5",
         "description"=>nil,
         "branches"=>[],
         "industry"=>"industry_5"
        },
        {"name"=>"Schaden Group_6",
         "description"=>nil,
         "branches"=>[],
         "industry"=>"industry_6"
        }],
        "page"=>1,
        "total_pages"=>1,
        "total_entries"=>3}
    ), status: :ok
  end

  def team_companies
    render json: Oj.dump(
      {"companies"=>[
        {"name"=>"Moen LLC_4",
         "description"=>nil,
         "branches"=>[],
         "industry"=>"industry_4"
        },
        {"name"=>"Huel-Christiansen_5",
         "description"=>nil,
         "branches"=>[],
         "industry"=>"industry_5"
        },
        {"name"=>"Schaden Group_6",
         "description"=>nil,
         "branches"=>[],
         "industry"=>"industry_6"
        }],
        "page"=>1,
        "total_pages"=>1,
        "total_entries"=>3}
    ), status: :ok
  end

  add_authentication_params [:search, :import, :show, :user_acompanies, :team_companies]
end
