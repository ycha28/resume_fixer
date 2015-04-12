class SubmissionMailer < ActionMailer::Base
  default from: 'young.cha@hyfn.com'

  def submit_documents(cover_letters, resumes, essays)
    @cover_letters = cover_letters
    @resumes = resumes
    @essays = essays
    files = cover_letters + resumes + essays
    files.each do |file|
      attachments[file.original_filename] = File.read(file.tempfile)
    end
    mail(to: 'youngcha3785@gmail.com', subject: 'Test email')
  end
end