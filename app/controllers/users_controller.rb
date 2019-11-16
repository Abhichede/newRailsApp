class UsersController < ApplicationController
  before_action :authorised?
  before_action :find_user, only: %i[toggle_user_status]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10).order(:role)
  end

  def toggle_user_status
    active_status = @user.active?
    @user.update!(active: !active_status)
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

  private
  def find_user
   @user =  User.find(params['id']) if params['id'].present?
  end
end
