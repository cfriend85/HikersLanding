class Hike < ActiveRecord::Base
  belongs_to :user
  validates :description, :trail, length: {maximum:40}, on: :create, on: :update, presence: true
  validates :city, length: {maximum:40}, on: :create, on: :update, presence: true
  validates :state, length: {maximum:2}, on: :create, on: :update, presence: true
  validates :state, length: {maximum:2}, on: :create, on: :update, presence: true
  # validates :hike_date_cannot_be_in_the_past, on: :create, :update, presence: true
  validates :time, on: :create, on: :update, presence: true
  validates :image_url, on: :create, on: :update, presence: true
  has_many :users
  has_many :users_joined, through: :joins, source: :user, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :comments, dependent: :destroy
end
