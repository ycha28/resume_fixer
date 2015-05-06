class SubmissionsController < ApplicationController
  def new
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
    params.require(:submission).permit(:documents_attributes => [:description]).merge(:card => params[:stripeToken])
  end
end