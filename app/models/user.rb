class User < ApplicationRecord
    has_many :user_ingredients
    has_many :ingredients, through: :user_ingredients

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
end
