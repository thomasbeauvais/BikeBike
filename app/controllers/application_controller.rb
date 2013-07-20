require "yaml"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate

  def authenticate
    if File.exist?('authenticate.yml')
      data = YAML.load_file('authenticate.yml')
      authenticate_or_request_with_http_basic do |username, password|
        username == data['user'] && password == data['pass']
      end 
    end
  end
  
end
