class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, :with => :render_not_found

  include SessionsHelper
  include TrailsHelper

  def render_not_found
    puts "404 HIT"
    render "shared/404", :status => 404
  end  
end
