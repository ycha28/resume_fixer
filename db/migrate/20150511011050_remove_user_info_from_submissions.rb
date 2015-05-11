class RemoveUserInfoFromSubmissions < ActiveRecord::Migration
  def up
    remove_column :submissions, :name
    remove_column :submissions, :email
    remove_column :submissions, :description
    add_column :users, :phone_number, :string
    add_column :users, :timezone, :string
  end

  def down
    add_column :submissions, :name, :string
    add_column :submissions, :email, :string
    add_column :submissions, :description, :text
    remove_column :users, :phone_number, :string
    remove_column :users, :timezone, :string
  end
end
