require 'test_helper'

class BluetoothDevicesControllerTest < ActionController::TestCase
  setup do
    @bluetooth_device = bluetooth_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bluetooth_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bluetooth_device" do
    assert_difference('BluetoothDevice.count') do
      post :create, bluetooth_device: { active: @bluetooth_device.active, mac_adress: @bluetooth_device.mac_adress, name: @bluetooth_device.name }
    end

    assert_redirected_to bluetooth_device_path(assigns(:bluetooth_device))
  end

  test "should show bluetooth_device" do
    get :show, id: @bluetooth_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bluetooth_device
    assert_response :success
  end

  test "should update bluetooth_device" do
    patch :update, id: @bluetooth_device, bluetooth_device: { active: @bluetooth_device.active, mac_adress: @bluetooth_device.mac_adress, name: @bluetooth_device.name }
    assert_redirected_to bluetooth_device_path(assigns(:bluetooth_device))
  end

  test "should destroy bluetooth_device" do
    assert_difference('BluetoothDevice.count', -1) do
      delete :destroy, id: @bluetooth_device
    end

    assert_redirected_to bluetooth_devices_path
  end
end
