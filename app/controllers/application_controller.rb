class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  ## following code prevent rails to save cache page caching
  before_filter :set_cache_headers

  def authorised?
    if current_user.role === 'SUPERVISOR'
      respond_to do |f|
        f.html { redirect_to root_path, alert: 'You are not authorised to access this page.' }
      end
    end
  end


  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, max-age=0, must-revalidate, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
