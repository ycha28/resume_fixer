class AddDefaultCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_4_digits, :integer
  end
end
