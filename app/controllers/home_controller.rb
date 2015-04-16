class HomeController < ApplicationController
  def index
    @submission = Submission.new
  end
end