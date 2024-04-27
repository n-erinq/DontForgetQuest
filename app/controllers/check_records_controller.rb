class CheckRecordsController < ApplicationController

  def new
    @user = current_user
    @check_list = @user.check_list
    @check_items = @check_list.check_items
  end
  
  def create
    @user = current_user
    @check_list = @user.check_list
    @check_items = @check_list.check_items
    @check_record = @check_list.check_records.new(check_record_params)
      if @check_record.save
        redirect_to user_path(current_user), success: '本日のチェックが完了しました'
      else
        flash.now[:danger] = '全てチェックしよう！'
        render :new, status: :unprocessable_entity
      end
  end

  private

  def check_record_params
    params.require(:check_record).permit(check_item_ids: [])
  end
end
