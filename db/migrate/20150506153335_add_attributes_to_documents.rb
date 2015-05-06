class AddAttributesToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :content_type, :string
    add_column :documents, :original_filename, :string
    add_column :documents, :description, :text
  end
end
