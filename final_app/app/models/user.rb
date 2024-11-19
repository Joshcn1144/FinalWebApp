class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    # my user will have a one to many relationship with menus
    has_many :menus, dependent: :destroy

    #add validations and profile pic
end
