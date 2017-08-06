class GymsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show index]

  def new
    @user = current_user
    @gym = Gym.new
    @gym.build_address
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.user = current_user
    @gym.save
    redirect_to @gym
  end

  def show
    @gym = Gym.find(params[:id])
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

  def disapproved
    @gyms = Gym.all.where(approved: false)
  end

  def approve
    @gym = Gym.find(params[:id])
    @gym.approved = true
    @gym.save

    flash[:notice] = 'Gym Approved'
    GymMailer.notify_gym_approved(@gym).deliver_now
    redirect_to @gym
  end

  def my_gyms
    @gyms = current_user.gyms
  end

  def destroy
    @gym = Gym.find(params[:id])
    @gym.delete
    flash[:notice] = 'Gym deleted'
    redirect_to my_gyms_path
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :opening_time, :closing_time,
                                address_attributes:
                                %i[id address_type latitude longitude])
  end
end
