require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, card: { cc_cvc: @card.cc_cvc, cc_exp_month: @card.cc_exp_month, cc_exp_year: @card.cc_exp_year, cc_name: @card.cc_name, cc_number: @card.cc_number, cc_type: @card.cc_type }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card
    assert_response :success
  end

  test "should update card" do
    put :update, id: @card, card: { cc_cvc: @card.cc_cvc, cc_exp_month: @card.cc_exp_month, cc_exp_year: @card.cc_exp_year, cc_name: @card.cc_name, cc_number: @card.cc_number, cc_type: @card.cc_type }
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: @card
    end

    assert_redirected_to cards_path
  end
end
