class UsersController < ApplicationController
  before_action :authorised?

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10).order(:role)
  end


  def self.online?(user)
    if user.updated_at > 10.minutes.ago
      return true

    else
      return false
    end
  end
end
