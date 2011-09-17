class AddDeviceAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :device_name, :string
    add_column :users, :device_platform, :string
    add_column :users, :device_version, :string
  end
end
