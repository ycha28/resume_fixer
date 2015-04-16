class SubmissionMailer < ActionMailer::Base
  def submit_documents(submission_form)
    @name = submission_form.name
    @phone_number = submission_form.phone_number
    @email = submission_form.email
    @cover_letters = submission_form.cover_letters
    @resumes = submission_form.resumes
    @essays = submission_form.essays
    @amount = submission_form.total_cost
    @cover_letter_description = submission_form.cover_letter_description
    @resume_description = submission_form.resume_description
    @essay_description = submission_form.essay_description

    files = @cover_letters + @resumes + @essays
    files.each do |file|
      attachments[file.original_filename] = File.read(file.tempfile)
    end

    mail(from: @email, to: ENV['DEFAULT_TO_EMAIL'], subject: "A new submission from #{@email}!")
  end
end