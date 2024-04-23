class TreasureBoxesController < ApplicationController
  before_action :authenticate_user!

  def new
    @treasure_box = TreasureBox.new
  end

  def create
    @user = current_user
    if @user && @user.treasure_box.nil?
      @treasure_box = @user.create_treasure_box(treasure_box_params)
      if @treasure_box.save
        redirect_to user_path(current_user), success: 'アワードを作成しました'
      else
        flash.now[:danger] = 'アワードを作成できませんでした'
        render :new
      end
      else
        redirect_to root_path, alert: 'ログインしてください'
    end
  end

  private

  def treasure_box_params
    params.require(:treasure_box).permit(award_ids:[])
  end

end
