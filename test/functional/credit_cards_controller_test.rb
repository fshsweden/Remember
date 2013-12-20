require 'test_helper'

class CreditCardsControllerTest < ActionController::TestCase
  setup do
    @credit_card = cards(:cards_001)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_card" do
    assert_difference('CreditCard.count') do
      post :create, credit_card: { cc_cvc: @credit_card.cc_cvc, cc_exp_month: @credit_card.cc_exp_month, cc_exp_year: @credit_card.cc_exp_year, cc_name: @credit_card.cc_name, cc_number: @credit_card.cc_number, cc_type: @credit_card.cc_type }
    end

    assert_redirected_to card_path(assigns(:credit_card))
  end

  test "should show credit_card" do
    get :show, id: @credit_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit_card
    assert_response :success
  end

  test "should update credit_card" do
    put :update, id: @credit_card, credit_card: { cc_cvc: @credit_card.cc_cvc, cc_exp_month: @credit_card.cc_exp_month, cc_exp_year: @credit_card.cc_exp_year, cc_name: @credit_card.cc_name, cc_number: @credit_card.cc_number, cc_type: @credit_card.cc_type }
    assert_redirected_to card_path(assigns(:credit_card))
  end

  test "should destroy credit_card" do
    assert_difference('CreditCard.count', -1) do
      delete :destroy, id: @credit_card
    end

    assert_redirected_to cards_path
  end
end
