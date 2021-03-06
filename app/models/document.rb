class Document < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  mount_uploader :text_file, TextFileUploader
  mount_uploader :edited_file, EditedFileUploader
  belongs_to :user
  belongs_to :submission

  scope :submitted, -> { where(submitted: true) }
  scope :by_updated_at, -> { order(:updated_at => :desc) }
  scope :over_ten_minutes, -> { where(arel_table[:created_at].lt(10.minutes.ago)) }
  scope :matching, -> { where(status: 'matching') }

  validates_presence_of :text_file
  validates_presence_of :type

  before_save :format_description
  before_save :set_to_complete
  # after_create :set_to_editing

  def formatted_type
    self.class.name.underscore.split('/').last
  end

  def formatted_created_at
    self.updated_at.strftime('%m/%d/%C @%l:%M %p')
  end

  def formatted_filename
    if original_filename.length > 20
      self.original_filename.sub(/(.{20})(.*)/, '\1') + '...'
    else
      original_filename
    end
  end

  private

  def format_description
    if description.present?
      self.description = simple_format(description)
    end
  end

  def set_to_editing
    Documents::ChangeStatusWorker.perform_at(1.minute.from_now, id, 'editing')
  end

  def set_to_complete
    if edited_file.present?
      self.status = 'complete'
    end
  end
end