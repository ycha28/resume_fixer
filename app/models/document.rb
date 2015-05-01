class Document < ActiveRecord::Base
  mount_uploader :text_file, TextFileUploader
  belongs_to :user
  belongs_to :submission
end