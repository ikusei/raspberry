# encoding: utf-8

class CreateBluetoothDevices < ActiveRecord::Migration
  def change
    create_table :bluetooth_devices do |t|
      t.string :mac_adress
      t.string :name
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
