class AddTextFileStringToDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :text_file_id
    add_column :documents, :text_file, :string
  end
end
