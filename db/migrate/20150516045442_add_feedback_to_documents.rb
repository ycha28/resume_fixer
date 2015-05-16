class AddFeedbackToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :feedback, :text
  end
end
