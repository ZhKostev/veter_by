class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :email
      t.string :condition
      t.float :level
      t.integer :wind_generator_id
      t.timestamps
    end
    add_index :notifications, [:wind_generator_id], :name => "n_wind_generator_id_index"
  end
end
