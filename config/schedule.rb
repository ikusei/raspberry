# encoding: utf-8

every 1.minute do
#   command "/usr/bin/some_great_command"
  runner "Event.lifx_at_home", :environment => 'development'
  #rake "events:lifx", :environment => 'development'
end