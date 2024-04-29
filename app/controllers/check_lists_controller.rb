class CheckListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_list, only: %i[edit update]

  def new
    @check_list = CheckList.new
  end

  def create
    @user = current_user
    if @user && @user.check_list.nil?
      @check_list = @user.create_check_list(check_list_params)
      if @check_list.save
        flash[:success] = 'チェックリストを作成しました'
        redirect_to user_path(current_user)
      else
        flash.now[:danger] = 'チェックリストを作成できませんでした'
        render :new, status: :unprocessable_entity
      end
      else
        redirect_to root_path, alert: 'ログインしてください'
    end
  end

  def edit; end

  def update
    if @check_list.update(check_list_params)
      flash[:success] = 'チェックリストを編集しました'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'チェックリストを編集できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def check_list_params
    params.require(:check_list).permit(:name, :period, check_item_ids:[])
  end

  def set_check_list
    @user = current_user
    @check_list = @user.check_list
  end
end
