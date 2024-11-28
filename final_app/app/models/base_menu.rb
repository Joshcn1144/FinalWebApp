class BaseMenu < ApplicationRecord
  belongs_to :owner
  has_many :menu_items, dependent: :destroy
end
