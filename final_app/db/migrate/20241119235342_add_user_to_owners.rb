class AddUserToOwners < ActiveRecord::Migration[7.1]
  def change
    add_reference :owners, :user, null: false, foreign_key: true
  end
end
