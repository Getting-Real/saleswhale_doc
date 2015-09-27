class Api::V1::ProspectsController< ApplicationController
  swagger_controller :prospects, 'Prospect Management'

  swagger_api :user_prospects do
    summary 'Return all prospects owned by user'
    response :unauthorized
    response :ok
  end

  swagger_api :team_prospects do
    summary 'Return all prospects of teams - User must be owner of team'
    response :unauthorized
    response :ok
  end

  swagger_api :company_prospects do
    summary 'Return all prospects under a company - User must have imported that company before hand'
    response :not_found
    response :unauthorized
    response :ok
  end

  swagger_api :show do
    summary 'Show detailed info of prospect'
    param :path, :prospect_id, :string, :required
    response :not_found
    response :unauthorized
    response :ok
  end

  swagger_api :import do
    summary 'Import a prospect'
    param :path, :prospect_id, :string, :required
    response :not_found
    response :unprocessable_entity
    response :ok
  end

  def user_prospects
    render json: Oj.dump(
      {"prospects"=>
       [
         {"name"=>"Mrs. Athena Metz",
          "linkedin_url"=>"http://blockbatz.org/virgie",
          "prospect_contacts"=>[],
          "company"=>
          {
            "name"=>"Mante Group_1"}
        },
        {"name"=>"Mrs. Athena Metz",
         "linkedin_url"=>"http://blockbatz.org/virgie",
         "prospect_contacts"=>[],
         "company"=>
         {
           "name"=>"Thompson, Fahey and Morissette_2"
         }
        }
       ],
       "page"=>1,
       "total_pages"=>1,
       "total_entries"=>2}
    ), status: :ok
  end

  def team_prospects
    render json: Oj.dump(
      {"prospects"=>
       [
         {"name"=>"Mrs. Athena Metz",
          "linkedin_url"=>"http://blockbatz.org/virgie",
          "prospect_contacts"=>[],
          "company"=>
          {
            "name"=>"Mante Group_1"}
        },
        {"name"=>"Mrs. Athena Metz",
         "linkedin_url"=>"http://blockbatz.org/virgie",
         "prospect_contacts"=>[],
         "company"=>
         {
           "name"=>"Thompson, Fahey and Morissette_2"
         }
        }
       ],
       "page"=>1,
       "total_pages"=>1,
       "total_entries"=>2}
    ), status: :ok
  end

  def company_prospects
    render json: Oj.dump(
      {"prospects"=>
       [
         {"name"=>"Heloise Will"},
         {"name"=>"Heloise Will"}
       ],
       "page"=>1,
       "total_pages"=>1,
       "total_entries"=>2
      }
    ), status: :ok
  end

  def show
    render json: Oj.dump(
      {"name"=>"Ms. Leanna Pfannerstill",
       "linkedin_url"=>"http://considinehoeger.net/miracle",
       "prospect_contacts"=>[],
       "company"=>{
         "name"=>"Tromp, Gaylord and Dicki_2"}
        }
    ), status: :ok
  end

  def import
    render nothing: true, status: :ok
  end

  add_pagination_params [:user_prospects, :team_prospects, :company_prospects]
  add_authentication_params [:user_prospects, :team_prospects, :company_prospects, :show, :import]
end
