class GymsController < ApplicationController
    
    def new
        @user = current_user
        @gym = Gym.new
        @gym.build_address
        #byebug
        #1.times(@gym.address.build)
    end

    def create
        @user = current_user
        @user.gym.create(gym_params)
        redirect_to @user.gym.first
    end

    def show
        @user.gyms
    end
    
    private
    
    def gym_params
        params.require(:gym).permit(:name, :opening_time, :closing_time, :user_id,
            address_attributes: [:id, :address_type, :latitude, :longitude])
    end
    
end