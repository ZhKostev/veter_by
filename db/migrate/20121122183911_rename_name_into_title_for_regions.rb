class RenameNameIntoTitleForRegions < ActiveRecord::Migration
  def up
    rename_column :regions, :name, :title
  end

  def down
    rename_column :regions, :title, :name
  end
end
