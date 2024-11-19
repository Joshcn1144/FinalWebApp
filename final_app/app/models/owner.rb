class Owner < ApplicationRecord

    has_many :menus, dependent: :destroy

    validates :company_name, presence: true
    validates :name, presence: true
end
