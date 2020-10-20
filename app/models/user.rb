class User < ApplicationRecord
has_many :ingredients
has_many :user_recipes
has_many :shopping_items
has_secure_password

validates_presence_of :email
validates_uniqueness_of :email
end
