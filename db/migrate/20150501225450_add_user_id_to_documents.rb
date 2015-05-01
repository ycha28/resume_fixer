class AddUserIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :user_id, :integer
    remove_column :documents, :filename
    remove_column :documents, :content_type
    remove_column :documents, :file_contents
  end
end
