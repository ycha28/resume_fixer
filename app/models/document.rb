class Document < ActiveRecord::Base
  mount_uploader :text_file, TextFileUploader
  belongs_to :user
  belongs_to :submission

  validates_presence_of :text_file

  def formatted_type
    self.class.name.underscore.split('/').last
  end
end