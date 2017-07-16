class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    2.times {@user.addresses.build}
  end

  def create
    @user = User.new(sign_up_params)
    if verify_addresses_count(@user.addresses) >= 1
      if @user.save
        sign_in(@user, scope: :user)
        redirect_to root_path
        byebug
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def verify_addresses_count(addresses)
    if addresses[0].address_type.nil? or addresses[0].latitude.nil? or addresses[0].longitude.nil?
      return 0
    end

    if addresses[1].address_type.nil? or addresses[1].latitude.nil? or addresses[1].longitude.nil?
      return 1
    end

    return 2
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gym_manager,
      addresses_attributes: [:id, :address_type, :latitude, :longitude])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gym_manager,
      addresses_attributes: [:id, :address_type, :latitude, :longitude])
  end
end
