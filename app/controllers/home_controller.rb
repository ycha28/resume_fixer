class HomeController < ApplicationController
  def index
    @submission = Submission.new
  end

  def create
    binding.pry
  end
end