class Menu < ApplicationRecord
  belongs_to :owner

  validates :item, presence: true
  validates :price, presence: true

end
