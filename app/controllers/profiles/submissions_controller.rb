module Profiles
  class SubmissionsController < AuthenticationController
    layout 'profiles'

    def new
      @submission = current_user.submissions.build
    end

    def create
      SubmissionForm.new(submission_params).save
      redirect_to root_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end

    private

    def submission_params
      params.require(:submission).permit(:documents_attributes => [:description]).merge(:card => params[:stripeToken], :user => current_user)
    end
  end
end