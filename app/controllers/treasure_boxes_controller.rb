class TreasureBoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treasure_box, only: %i[edit update]

  def new
    @treasure_box = TreasureBox.new
  end

  def create
    @user = current_user
    if @user && @user.treasure_box.nil?
      @treasure_box = @user.create_treasure_box(treasure_box_params)
      if @treasure_box.save
        flash[:success] = 'アワードを作成しました'
        redirect_to user_path(current_user)
      else
        flash.now[:danger] = 'アワードを作成できませんでした'
        render :new, status: :unprocessable_entity
      end
      else
        redirect_to root_path, alert: 'ログインしてください'
    end
  end

  def edit; end

  def update
    if @treasure_box.update(treasure_box_params)
      flash[:success] = 'アワードを編集しました'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'アワードを編集できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def treasure_box_params
    params.require(:treasure_box).permit(award_ids:[])
  end

  def set_treasure_box
    @user = current_user
    @treasure_box = @user.treasure_box
  end

end
