class CreateClientOrders < ActiveRecord::Migration
  def change
    create_table :client_orders do |t|

      t.timestamps null: false
    end
  end
end
