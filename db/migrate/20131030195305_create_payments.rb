class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :service
      t.integer :line_item_id
      t.timestamps
    end
    add_index :payments, [:service_id, :line_item_id], unique: true
  end
end
