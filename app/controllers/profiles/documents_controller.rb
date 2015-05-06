module Profiles
  class DocumentsController < AuthenticationController
    before_filter :sanitize_document_type

    def create
      document = current_user.documents.build(document_params)
      
      if document.save 
        render :json => document.as_json, :status => 200
      else
        render :json => ({:discussion => document.errors.full_messages}), :status => 422
      end
    end

    private

    def text_file
      params[:text_file]
    end

    def document_params
      params.permit(:text_file, :type).merge(content_type: text_file.content_type, original_filename: text_file.original_filename)
    end

    def sanitize_document_type
      params[:type] = case params[:type]
                      when 'Resume'
                        'Documents::Resume'
                      when 'CV'
                        'Documents::CoverLetter'
                      when 'Essay'
                        'Documents::Essay'
                      end
    end
  end
end