class Document < ActiveRecord::Base
  mount_uploader :text_file, TextFileUploader
  belongs_to :user
  belongs_to :submission

  scope :submitted, -> { where(submitted: true) }

  validates_presence_of :text_file
  validates_presence_of :type

  def formatted_type
    self.class.name.underscore.split('/').last
  end

  def formatted_created_at
    self.created_at.strftime('%m/%d/%C @%k:%M %p')
  end
end