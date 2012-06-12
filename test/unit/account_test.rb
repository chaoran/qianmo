require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "email or cell phone must be present" do
    account = Account.new
    account.password = "111"
    assert account.invalid?
  end
end
