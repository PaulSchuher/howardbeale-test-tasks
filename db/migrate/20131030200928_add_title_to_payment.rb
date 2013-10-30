class AddTitleToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :title, :string
  end
end
