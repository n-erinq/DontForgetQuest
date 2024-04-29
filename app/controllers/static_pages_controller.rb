class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:congratulations]

  def top; end
  def guide; end
  def terms; end
  def privacy_policy; end

  def congratulations
    @user = current_user
    @check_list = @user.check_list
      
    if @user.treasure_box.present?
      if @check_list.days_3?
         @treasure_items = @user.treasure_box.awards.where('awards.required_checks = ?', Award.required_checks[:days_3])
         @random_award = @treasure_items.order("RANDOM()").first
      elsif @check_list.weeks_3?
         @treasure_items = @user.treasure_box.awards.where('awards.required_checks = ?', Award.required_checks[:weeks_3])
         @random_award = @treasure_items.order("RANDOM()").first
      elsif @check_list.months_3?
         @treasure_items = @user.treasure_box.awards.where('awards.required_checks = ?', Award.required_checks[:months_3])
         @random_award = @treasure_items.order("RANDOM()").first
      end
  end
 end
end
