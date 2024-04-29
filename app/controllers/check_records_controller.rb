class CheckRecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @check_list = @user.open_check_list
    @check_items = @check_list.check_items
  end
  
  def create
    @user = current_user
    @check_list = @user.open_check_list
    @check_items = @check_list.check_items
    @check_record = @check_list.check_records.new(check_record_params)
      if @check_record.save
         @check_list.reload
         redirect_needed = false
      if @check_list.days_3? && @check_list.check_records.count == 3 ||
         @check_list.weeks_3? && @check_list.check_records.count == 21 ||
         @check_list.months_3? && @check_list.check_records.count == 84
          redirect_to congratulations_path
          redirect_needed = true
       end
       unless redirect_needed
        flash[:success] = '本日のチェックが完了しました'
        redirect_to user_path(current_user)
       end
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
