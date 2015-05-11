class ProfilesController < AuthenticationController
  layout 'profiles'

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:success] = "Profile settings successfully updated!"
      redirect_to profile_documents_path
    else
      flash[:danger] = "An error occurred while updating your profile."
      redirect_to profile_documents_path      
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :timezone)
  end
end