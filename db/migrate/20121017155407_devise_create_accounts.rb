class DeviseCreateAccounts < ActiveRecord::Migration
  def change
    create_table(:accounts) do |t|
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps
    end

    add_index :accounts, :email,                :unique => true
  end
end
