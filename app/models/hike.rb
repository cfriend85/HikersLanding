class Hike < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :users_joined, through: :joins, source: :user, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :comments
end
