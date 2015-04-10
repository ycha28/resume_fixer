class AddTextFileToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :text_file, :string
  end
end
