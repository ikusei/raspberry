# encoding: utf-8

class BluetoothDevice < ActiveRecord::Base

  def self.anyone_at_home?
    BluetoothDevice.all.map{|a| a.online?}.include?(true)
  end

  def online?
    status = `sudo l2ping -c 1 #{self.mac_adress}`
    logger.info(status)
    status.include?("1 received")
  end

end
