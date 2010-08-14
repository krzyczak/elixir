require 'test_helper'

class MultiTransfersControllerTest < ActionController::TestCase
  setup do
    @multi_transfer = multi_transfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multi_transfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multi_transfer" do
    assert_difference('MultiTransfer.count') do
      post :create, :multi_transfer => @multi_transfer.attributes
    end

    assert_redirected_to multi_transfer_path(assigns(:multi_transfer))
  end

  test "should show multi_transfer" do
    get :show, :id => @multi_transfer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @multi_transfer.to_param
    assert_response :success
  end

  test "should update multi_transfer" do
    put :update, :id => @multi_transfer.to_param, :multi_transfer => @multi_transfer.attributes
    assert_redirected_to multi_transfer_path(assigns(:multi_transfer))
  end

  test "should destroy multi_transfer" do
    assert_difference('MultiTransfer.count', -1) do
      delete :destroy, :id => @multi_transfer.to_param
    end

    assert_redirected_to multi_transfers_path
  end
end
