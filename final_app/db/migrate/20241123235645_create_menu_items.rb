class CreateMenuItems < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.boolean :available
      t.references :base_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
