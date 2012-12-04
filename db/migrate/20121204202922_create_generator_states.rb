class CreateGeneratorStates < ActiveRecord::Migration
  def change
    create_table :generator_states do |t|
      t.integer :wind_generator_id
      t.float :wind_speed
      t.float :power
      t.boolean :error, :default => false

      t.timestamps
    end

    add_index :generator_states, [:wind_generator_id], :name => "states_wind_generator_id_index"
  end
end
