class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  ## following code prevent rails to save cache page caching
  # before_filter :set_cache_headers

  def authorised?
    if current_user.role === 'SUPERVISOR' || current_user.role === 'ENGINEER'
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

  def apply_list_sort(default_sort_by: 'created_at', default_sort_dir: 'desc')
    @sort_by = %w[created_at name].include?(params[:sort_by]) ? params[:sort_by] : default_sort_by
    @sort_dir = %w[asc desc].include?(params[:sort_dir]) ? params[:sort_dir] : default_sort_dir
    { @sort_by => @sort_dir.to_sym }
  end
end
