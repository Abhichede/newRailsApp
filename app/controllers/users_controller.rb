class UsersController < ApplicationController
  before_action :authorised?

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10).order(:role)
  end

  def toggle_user_status
    @user =  User.find(params['id'])
    @user.update!(active: !@user.active?)
    respond_to do |format|
      format.html
      format.json { 
        render status: :no_content
       }
    end
  end

  def self.online?(user)
    user.is_online
  end

end
