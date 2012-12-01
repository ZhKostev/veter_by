class AddPhotoToWindGenerators < ActiveRecord::Migration
  def change
    add_column :wind_generators, :photo, :string
  end
end
