class Hike < ActiveRecord::Base
  belongs_to :user
  validates :description, :trail, :city, length: {maximum:40}, presence: true
  validates :state, length: {maximum:2},  presence: true
  validates :hike_date, presence: true
  validates :time, presence: true
  validates :image_url, presence: true, url: true
  has_many :users
  has_many :users_joined, through: :joins, source: :user, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :comments, dependent: :destroy
end
