class AddStatusToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :status, :string, default: 'matching'
  end
end
