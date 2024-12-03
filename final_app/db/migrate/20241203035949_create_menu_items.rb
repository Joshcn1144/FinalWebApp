class CreateMenuItems < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_items do |t|
      t.string :item
      t.text :description
      t.decimal :price
      t.boolean :available
      t.references :base_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
