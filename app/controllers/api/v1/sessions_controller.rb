class Api::V1::SessionsController < ApplicationController
  swagger_controller :session, 'Session Management'

  swagger_api :create do
    summary 'Allow user to login in'
    notes 'Generate authentication token which can then be use to access other restricted APIsi, token will be stored in Redis for easy access later on'
    param :form, :username, :string, :required, 'Unique string represent the user'
    param :form, :password, :string, :required
    response :unprocessable_entity, 'Username or Email had already in use'
    response :unauthorized
  end

  swagger_api :destroy do
    summary 'Allow user to logout'
    notes 'Destroy user authentication token in both database and Redis'
    param :form, :username, :string, :required
    param :form, :authentication_token, :string, :required
    response :not_found, 'User not found'
    response :unauthorized, 'Username and authentication token do not match'
  end

  def create
    render json: Oj.dump({
                            id: 1234,
                            username: params[:username],
                            email: 'jonsnow@thewall.got',
                            authentication_token: 'daskdalks091340324klasdja'
                         }), status: :created
  end

  def destroy
    render nothing: true, status: :ok
  end
end
