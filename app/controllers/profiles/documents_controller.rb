module Profiles
  class DocumentsController < AuthenticationController
    def create
      binding.pry
      head :ok
    end

    private

    def document_params
      params.require(:submission).permit(:cover_letters)
    end
  end
end