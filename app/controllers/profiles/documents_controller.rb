module Profiles
  class DocumentsController < AuthenticationController
    def create
      document = current_user.documents.build
      document.text_file = params[:document]
      
      if document.save 
        head :ok
      else
        render :json => ({:discussion => document.errors.full_messages}), :status => 422
      end
    end
  end
end