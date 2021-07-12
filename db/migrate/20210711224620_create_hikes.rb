class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
      t.string :description
      t.string :trail
      t.string :city
      t.string :state
      t.datetime :hike_date
      t.string :time
      t.string :image_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
