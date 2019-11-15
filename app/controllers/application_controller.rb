require "#{Rails.root}/lib/json_web_token"

class ApplicationController < ActionController::API
  include RequestAuthentication
end
