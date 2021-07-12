class Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :hike
end
