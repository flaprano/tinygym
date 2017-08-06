class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: %i[edit]

  def new
    @user = User.new
    1.times { @user.addresses.build }
  end

  def create
    @user = User.new(sign_up_params)
    if gym_manager_save? || regular_user_save?
      if @user.save
        sign_in(@user, scope: :user)
        redirect_to root_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @user = current_user
    1.times { @user.addresses.build }
  end

  private

  def addresses_count(addresses)
    addresses_count = 0
    addresses.each do |address|
      unless address.address_type.empty? &&
             address.latitude.empty? && address.longitude.empty?
        addresses_count += 1
      end
    end

    addresses_count
  end

  def gym_manager_save?
    (addresses_count(@user.addresses) >= 1 && @user.gym_manager?)
  end

  def regular_user_save?
    (addresses_count(@user.addresses) >= 2 && @user.gym_manager? == false)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :gym_manager, addresses_attributes:
                                 %i[id address_type latitude longitude])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :current_password, :name, :gym_manager,
                                 addresses_attributes:
                                 %i[id address_type latitude longitude])
  end
end
