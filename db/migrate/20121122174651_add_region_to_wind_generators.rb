class AddRegionToWindGenerators < ActiveRecord::Migration
  def change
    add_column :wind_generators, :region_id, :integer
    add_index :wind_generators, [:region_id], :name => "wg_region_id_index"
  end
end
