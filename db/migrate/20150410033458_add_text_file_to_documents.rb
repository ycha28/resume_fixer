class AddTextFileToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :text_file_id, :string
  end
end
