class DailyTokensController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]

  def create
    @daily_token = DailyToken.get_daily_token current_user
    if @daily_token.id.nil?
      @daily_token.user = current_user
      @daily_token.save
      flash[:notice] = 'Token generated with success'
    else
      flash[:notice] = 'Daily token already retrivied'
    end
    redirect_to @daily_token
  end

  def show
    @daily_token = DailyToken.find(params[:id])
  end
end
