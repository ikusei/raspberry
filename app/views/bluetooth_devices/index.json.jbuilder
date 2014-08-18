json.array!(@bluetooth_devices) do |bluetooth_device|
  json.extract! bluetooth_device, :id, :mac_adress, :name, :active
  json.url bluetooth_device_url(bluetooth_device, format: :json)
end
