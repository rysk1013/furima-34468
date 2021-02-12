class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == EVN["BASIC_AUTH_USER"] && password == EVN["BASIC_AUTH_USER"]
    end
  end
end
