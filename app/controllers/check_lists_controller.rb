class CheckListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_list, only: %i[edit update]

  def index
    @user = current_user
    @closed_check_lists = @user.check_lists.where(open: false) 
  end

  def new
    @check_list = CheckList.new
  end

  def create
    @user = current_user
    if @user && @user.check_lists.where(open: true).empty?
      @check_list = @user.check_lists.new(check_list_params)
      if @check_list.save
        flash[:success] = 'チェックリストを作成しました'
        redirect_to user_path(current_user)
      else
        flash.now[:danger] = 'チェックリストを作成できませんでした'
        render :new, status: :unprocessable_entity
      end
      else
        redirect_to root_path, alert: 'すでに開始済みのチェックリストが存在するか、ログインしてください'
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
    @check_list = current_user.open_check_list
  end
end
