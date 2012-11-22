class DropNotificationSubscribers < ActiveRecord::Migration
  def up
    drop_table :notification_subscribers
  end

  def down
    create_table :notification_subscribers do |t|
      t.string :email
      t.float :power_level
      t.belongs_to :wind_generator
      t.timestamps
    end

    add_index :notification_subscribers, [:wind_generator_id], :name => "notification_subscribers_wind_generator_id_index"
  end
end
