class ProfilesController < AuthenticationController
  layout 'profiles'

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render :json => response_params, :status => 200
    else
      render :json => @user.errors.full_messages.join(','), :status => 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :timezone, :password, :password_confirmation)
  end

  def response_params
    field = user_params.keys[0]
    {field: field.split('_').map(&:capitalize).join(' ')}
  end
end