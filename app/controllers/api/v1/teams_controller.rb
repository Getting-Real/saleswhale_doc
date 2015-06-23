class Api::V1::TeamsController < ApplicationController
  swagger_controller :teams, 'Team Management'

  swagger_api :create do
    summary 'Allow user to create team'
    notes 'Team name must be unique'
    param :form, :name, :string, :required, 'Name for the new team'
    response :unprocesseable_entity, 'team already exist, or team name is not acceptable'
  end

  swagger_api :info do
    summary 'Return team info'
    param :form, :team_id, :integer, :required
    response :not_found, 'team does not exist'
    response :unauthorized, 'You did not have access to this team'
  end

  swagger_api :switch_role do
    summary 'Update member role (owner or collaborator)'
    param :form, :team_id, :integer, :required
    param :form, :member_user_id, :integer, :required, 'User to change role'
    param :form, :role, :string, :required, 'New role to change to'
    response :not_found, 'team does not exist | user does not exist'
    response :unprocessable_entity, 'user does not belong to team | missing required params'
    response :unauthorized, 'you are not the owner of the team'
  end

  def create
    render json: Oj.dump({
      name: 'Thewall',
      members: [
        {
          user: {
            id: 26,
            username: 'jonsnow',
            email: 'jonsnow@thewall.got'
          },
          role: 'owner'
        }
      ]
    }), status: :created
  end

  def info
    render json: Oj.dump({
      name: 'Thewall',
      members: [
        {
          user: {
            id: 26,
            username: 'jonsnow',
            email: 'jonsnow@thewall.got'
          },
          role: 'owner'
        },
        {
          user: {
            id: 27,
            username: 'sam',
            email: 'sam@thewall.got'
          },
          role: 'member'
        }
      ]
    }), status: :ok
  end

  def switch_role
    render nothing: true, status: :created
  end
end
