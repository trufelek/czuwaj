class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.decimal :price, precision: 5, scale: 2
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :magazines, :users
  end
end
