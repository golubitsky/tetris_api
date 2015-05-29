class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  before_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
    if request.headers["HTTP_ORIGIN"] == 'http://golubitsky.github.io' ||
      request.headers["HTTP_ORIGIN"] == 'https://golubitsky.github.io'
      access_control_allow_origin = request.headers["HTTP_ORIGIN"]
    end

    headers['Access-Control-Allow-Origin'] = access_control_allow_origin
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
    headers['Access-Control-Request-Method'] = 'POST'
  end
end
