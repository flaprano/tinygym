class DailyTokensController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]

  def create
    @daily_token = DailyToken.new
    @daily_token.user = current_user
    if @daily_token.save
      redirect_to @daily_token
    else
      flash[:error] = 'Erro ao gerar token diário'
    end
  end

  def show
    @daily_token = DailyToken.find(params[:id])
  end
end
