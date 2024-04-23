class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@user = User.find_by(id: params[:id])
    @treasure_box = @user.treasure_box
  end
end
