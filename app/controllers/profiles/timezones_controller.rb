module Profiles
  class TimezonesController < AuthenticationController
    def new
      @user = current_user
    end

    def update
      @user = current_user

      if @user.update(user_params)
        redirect_to profile_documents_path
      else
        render :json => @user.errors.full_messages.join(','), :status => 422
      end      
    end

    private

    def user_params
      params.require(:user).permit(:timezone)
    end
  end
end