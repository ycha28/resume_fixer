class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :email
      t.string :card
      t.string :customer_id
      t.integer :amount
      t.string :description
      t.string :currency

      t.timestamps
    end
  end
end
