class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hike
  validates :content, length: {maximum:150}, on: :create, on: :update, presence: true
end
