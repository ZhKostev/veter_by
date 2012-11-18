class CreateWindGenerators < ActiveRecord::Migration
  def change
    create_table :wind_generators do |t|
      t.string :title
      t.float :min_rated_power
      t.float :max_rated_power
      t.float :min_rated_wind_speed
      t.float :max_wind_speed
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
