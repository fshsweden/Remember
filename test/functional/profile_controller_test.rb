require 'test_helper'

class ProfileControllerTest < ActionController::TestCase

	setup do
		@user = User.create!(
				:email => 'testuser@demomailtest.com',
				:password => 'MyTestingPassword',
				:password_confirmation => 'MyTestingPassword'
		)
		sign_in @user
	end

  test "should get index" do
    get :index
    assert_response :success
  end

end
