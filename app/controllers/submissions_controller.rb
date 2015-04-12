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
    params.require(:submission).permit(:name, :cover_letters => [], :resumes => [], :essays => []).merge({:email => params[:stripeEmail], :card => params[:stripeToken]})
  end
end