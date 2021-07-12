class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true, presence: true
  validates :password, length: {maximum:72}, on: :create, presence: true
  validates :password_confirmation, on: :create, length: {maximum:72}, presence: true
  has_many :hikes
  has_many :hikes_joined, through: :joins, source: :hike
  has_many :comments
end
