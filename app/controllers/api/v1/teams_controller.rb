class Api::V1::TeamsController < ApplicationController
  swagger_controller :teams, 'Team Management'

  swagger_api :info do
    summary 'Return team info'
    response :not_found, 'team does not exist'
    response :unauthorized, 'You did not have access to this team'
    response :ok
  end

  swagger_api :confirm_team do
    summary 'Allow new uear with invitation (type: owner) to finalize the team creation process and got added as owner'
    param :query, :invite_hash, :string, :required, 'Hash string of invite'
    response :not_found, 'team does not exist or invite does not exist'
    response :bad_request, 'invite hash param is missing'
    response :ok
  end

  swagger_api :invite do
    summary 'Allow owner to send out invitation'
    param :query, :email, :string, :required, 'Email of user to send invite to'
    param :query, :name,  :string, :optional, 'Name of user to send invite to'
    response :bad_request, 'email param missing'
    response :unauthorized, 'Must be owner of team'
    response :created
  end

  def confirm_team
    render json: Oj.dump({name: 'Saleswhale'}), status: :ok
  end

  def info
    render json: Oj.dump({name: 'Thewall'}), status: :ok
  end

  def invite
    render nothing: true, status: :created
  end

  add_authentication_params [:info, :invite]
end
