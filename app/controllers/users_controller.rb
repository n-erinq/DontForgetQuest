class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @treasure_box = @user.treasure_box
    @check_list = @user.open_check_list
  end
end
