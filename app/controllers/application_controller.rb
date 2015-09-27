class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  class << self
    def add_authentication_params(actions)
      actions.each do |action|
        swagger_api action do
          param :path, :team_id, :integer, :required, 'Id of team'
          param :query, :token, :string, :required, "User's authentication token", defaultValue: 'saleswhale-tok'
        end
      end
    end

    def add_pagination_params(actions)
      actions.each do |action|
        swagger_api action do
          param :query, :page, :integer, :optional, 'Used to navigate from page to page. Default is 1.', defaultValue: 1
          param :query, :per_page, :integer, :optional, 'Used to navigate from page to page. Default is 10. Maximum is 50.', defaultValue: 10, maximum: 50
        end
      end
    end
  end
end
