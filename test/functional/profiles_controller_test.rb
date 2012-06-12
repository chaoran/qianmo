require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
    @profile = @account.profile
  end
  
  test "should get new" do
    get :new, :account_id => @account
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, account_id: @account, :profile => { 
        date_of_birth: @profile.date_of_birth, 
        sex: @profile.sex, 
        hometown: @profile.hometown, 
        current_city: @profile.current_city, 
        real_name: @profile.real_name 
      }
    end

    assert_redirected_to account_profile_path(@account)
  end

  test "should show profile" do
    get :show, account_id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, account_id: @account
    assert_response :success
  end

  test "should update profile" do
    put :update, account_id: @profile, profile: { 
      date_of_birth: @profile.date_of_birth, 
      sex: @profile.sex, 
      hometown: @profile.hometown, 
      current_city: @profile.current_city, 
      real_name: @profile.real_name 
    }
    assert_redirected_to account_profile_path(@account)
  end
end
