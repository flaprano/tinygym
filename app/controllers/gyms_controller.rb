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
    @gyms = []
    @addresses = current_user.addresses

    if params[:address]
      address = current_user.addresses.find(params[:address])
    elsif params[:location]
      address = Address.new
      address.latitude = params[:location].split(',')[0]
      address.longitude = params[:location].split(',')[1]
    else
      address = current_user.addresses[0]
    end

    addresses = Address.near(address, 20).where("model_type = 'Gym'")

    addresses.each do |ad|
      @gyms << Gym.find(ad.model_id)
    end

    flash[:alert] = 'There is no gym around you' if @gyms.empty?
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :opening_time, :closing_time, :user_id,
                                address_attributes:
                                %i[id address_type latitude longitude])
  end
end
