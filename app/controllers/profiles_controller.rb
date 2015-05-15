class ProfilesController < AuthenticationController
  layout 'profiles'
  respond_to :json, :only => [:update]

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      respond_with @user
    else
      render :json => @user.errors.full_messages.join(','), :status => 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :timezone, :password, :password_confirmation)
  end
end