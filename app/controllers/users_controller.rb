class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @treasure_box = @user.treasure_box
    @check_list = @user.check_list
  end
end
