class Api::V1::UsersController < ApplicationController
  swagger_controller :users, 'User Management'

  swagger_api :sign_up do
    summary 'Allow new user to create account'
    notes 'Create user account and also setup first self contact for user using user email'
    param :form, :username, :string, :required, 'Unique string representing the user'
    param :form, :email, :string, :required, 'User email, will be used to create first self contact'
    param :form, :password, :string, :required
    param :form, :password_confirmation, :string, :required
    response :unprocessable_entity, 'username, email already exist | password does not match | internal server error'
    response :created, 'Successfully create new user'
  end

  swagger_api :profile do
    summary 'Return user information'
    param :query, :user_id, :string, :required, 'User Id'
    response :not_found
    response :ok
  end

  def sign_up
    render json: Oj.dump({
                            id: 1234,
                            username: params[:username],
                            email: params[:email],
                            authentication_token: '230fdsljflksr239ufslnkdfls'
                        }), status: :created
  end

  def profile
    render json: Oj.dump({
                            id: params[:user_id],
                            username: 'jonsnow',
                            email: 'jonsnow@thewall.got',
                            authentication_token: '32daksljhasklfhdskfhdskfkh'
                        }), status: :ok
  end
end
