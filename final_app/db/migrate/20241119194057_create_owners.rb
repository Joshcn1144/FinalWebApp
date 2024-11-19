class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :company_name
      t.string :name

      t.timestamps
    end
  end
end
