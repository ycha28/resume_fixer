class AddSubmittedToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :submitted, :boolean, default: false
  end
end
