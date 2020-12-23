class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreigen_key: true
      t.references :item, null: false, foreigen_key: true

      t.timestamps
    end
  end
end
