class Document < ActiveRecord::Base
  belongs_to :submission
  attachment :text_file
end