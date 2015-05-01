module Profiles
  class CoverLettersController < AuthenticationController
    layout 'profiles'

    def new
      @submission = current_user.submissions.create
    end

    def create
      current_user.documents.create(cover_letter_params)
      head :ok
    end

    private

    def cover_letter_params
      params.require(:submission).permit(:cover_letters)
    end
  end
end