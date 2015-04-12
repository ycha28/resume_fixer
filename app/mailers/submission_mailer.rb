class SubmissionMailer < ActionMailer::Base
  default from: ENV['DEFAULT_FROM_EMAIL']

  def submit_documents(submission_form)
    @name = submission_form.name
    @email = submission_form.email
    @cover_letters = submission_form.cover_letters
    @resumes = submission_form.resumes
    @essays = submission_form.essays
    @amount = submission_form.total_cost

    files = @cover_letters + @resumes + @essays
    files.each do |file|
      attachments[file.original_filename] = File.read(file.tempfile)
    end

    mail(to: ENV['DEFAULT_TO_EMAIL'], subject: "A new submission from #{@name}!")
  end
end