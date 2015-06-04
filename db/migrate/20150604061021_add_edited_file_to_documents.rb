class AddEditedFileToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :edited_file, :string
  end
end
