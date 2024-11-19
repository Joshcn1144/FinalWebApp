class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.string :item
      t.text :description
      t.decimal :price
      t.boolean :available
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
