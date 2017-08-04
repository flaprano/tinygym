class GymsController < ApplicationController

  def new
    @user = current_user
    @gym = Gym.new
    @gym.build_address
  end

  def create
    @user = current_user
    @gym = Gym.create(gym_params)
    @user.gym = @gym
    redirect_to user_gym_path(@user, @gym)
  end

  def show
    @user = User.find(params[:user_id])
    @gym = @user.gym
  end

  def index
    @gyms = Gym.near(current_user.addresses[0].address, 20)
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :opening_time, :closing_time, :user_id,
      address_attributes: [:id, :address_type, :latitude, :longitude])
  end

end
