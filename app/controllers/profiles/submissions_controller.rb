module Profiles
  class SubmissionsController < AuthenticationController
    layout 'profiles'

    def new
      @submission = current_user.submissions.build
    end

    def create
      SubmissionForm.new(submission_params).save
      flash[:success] = "Thank you for submitting your documents. You should receive a confirmation email of the submission!"
      redirect_to profile_documents_path
    rescue Stripe::CardError => e
      flash[:danger] = e.message
      redirect_to profile_documents_path
    end

    private

    def submission_params
      params.require(:submission).permit(:documents_attributes => [:description]).merge(:card => params[:stripeToken], :user => current_user)
    end
  end
end