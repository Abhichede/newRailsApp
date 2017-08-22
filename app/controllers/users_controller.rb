class UsersController < ApplicationController
  before_action :authorised?

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10).order(:role)
  end
end
