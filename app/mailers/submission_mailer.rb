class SubmissionMailer < ActionMailer::Base
  def submit_documents(submission_form)
    @user = submission_form.user
    @submission = submission_form.submission

    mail(from: @user.email, to: ENV['DEFAULT_TO_EMAIL'], subject: "A new submission from #{@user.email}!")
  end
end