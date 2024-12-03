class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    has_many :base_menus, dependent: :destroy
    has_many :menu_items, through: :base_menus

    #validates :company_name, presence: true
    #validates :name, presence: true
end
