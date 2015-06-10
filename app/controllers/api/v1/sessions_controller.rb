class Api::V1::SessionsController < ApplicationController
  swagger_controller :session, 'Session Management'

  swagger_api :create do
    summary 'Allow user to login in'
    notes 'Generate authentication token which can then be use to access other restricted APIs'
    param :form, :username, :string, :required, 'Unique string represent the user'
    param :form, :password, :string, :required
    response :unauthorized
  end

  def create
    render json: Oj.dump({
                            id: 1234,
                            username: params[:username],
                            email: 'jonsnow@thewall.got',
                            authentication_token: 'daskdalks091340324klasdja'
                         }), status: :created
  end
end
