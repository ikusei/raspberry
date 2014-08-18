# encoding: utf-8

namespace :events do

  desc 'Switch Lifx Status'
  task :lifx => :environment do
    Event.lifx_at_home
  end
end
