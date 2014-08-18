# encoding: utf-8

class Event < ActiveRecord::Base

  def self.do_not_disturb?
    sleep_time_start = "2100"
    sleep_time_end = "0600"
    if Time.now.strftime("%H%M") > sleep_time_start || Time.now.strftime("%H%M") < sleep_time_end
      return true
    else
      return false
    end
  end

  def self.lifx_at_home
    if !self.do_not_disturb?
      logger.info("Searching for bluetooth devices...")
      client = LIFX::Client.lan
      client.discover!
      #Alle Lampen im Netzwerk

      logger.info("Lampen gefunden") if client.lights.any?

      client.lights.each do |l|
        #Lampen an oder aus schalten
        if BluetoothDevice.anyone_at_home?
          logger.info("Lampe einschalten")
          l.turn_on
        else
          logger.info("Lampe ausschalten")
          l.turn_off
        end
      end
    else
      logger.info("Do not disturb. Do not change lamps")
    end
  end

end
