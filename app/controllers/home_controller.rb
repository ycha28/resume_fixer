class HomeController < ApplicationController
  def index
    @submission = Submission.new
    @cover_letter = @submission.documents.build
  end
end