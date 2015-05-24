module Profiles
  class DocumentsController < AuthenticationController
    layout 'profiles'
    respond_to :json, :only => [:create, :destroy, :update]
    before_filter :sanitize_document_type, :only => [:create]

    def index
      @documents = current_user.documents.submitted
    end

    def create
      @document = current_user.documents.create(submission_document_params)
      respond_with @document
    end

    def destroy
      @document = current_user.documents.find(params[:id])

      if @document.destroy
        render :json => @document, :status => 200
      else
        render :json => ({:discussion => @document.errors.full_messages}), :status => 422
      end
    end

    def update
      @document = current_user.documents.find(params[:id])
      
      if @document.update(document_params)
        redirect_to profile_documents_path
      end
    end 

    def download
      @document = current_user.documents.find(params[:id])
      tempfile = Tempfile.new [SecureRandom.hex, @document.text_file_url.split('.').last], "#{Rails.root}/tmp"
      File.open(tempfile,'wb') do |file|  
        file.write open(@document.text_file_url).read()
      end
      send_file(tempfile.path)
    end

    private

    def text_file
      params[:text_file] || params[:document][:text_file]
    end

    def document_params
      params.require(:document).permit(:text_file, :description).merge(content_type: text_file.content_type, original_filename: text_file.original_filename)
    end

    def submission_document_params
      params.permit(:text_file, :type).merge(content_type: text_file.content_type, original_filename: text_file.original_filename)
    end

    def sanitize_document_type
      params[:type] = case params[:type]
                      when 'Resume'
                        'Documents::Resume'
                      when 'Cover Letter'
                        'Documents::CoverLetter'
                      when 'Essay'
                        'Documents::Essay'
                      end
    end
  end
end