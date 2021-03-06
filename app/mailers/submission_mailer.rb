class SubmissionMailer < ActionMailer::Base
  def submit_documents(submission_form)
    @user = submission_form.user
    @submission = submission_form.submission

    mail(from: ENV['DEFAULT_FROM_EMAIL'], to: ENV['DEFAULT_TO_EMAIL'], subject: "A new submission from #{@user.email}!")
  end

  def notify_user(submission_form)
    @user = submission_form.user
    @submission = submission_form.submission
    mail(from: ENV['DEFAULT_FROM_EMAIL'], to: @user.email, subject: "Your submission has been received at Beamdox!")
  end
end