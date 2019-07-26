require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a name or email" do
    user = User.new()
    expect(user).to_not be_valid
  end

  it "should save email addresses as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "should not have a short name" do
    @user.name = "bo"
    expect(@user).to_not be_valid
  end

  it "should not have a very long name" do
    @user.name = "bosadfgiyewgrkhsdbgsadldshbhkabhdgalsg"
    expect(@user).to_not be_valid
  end

  it "should have a valid email" do
    @user.email = "bosadf"
    expect(@user).to_not be_valid
  end

  it "should not create duplicate user" do
    @user.save
    duplicate = @user.dup
    expect(duplicate.save).to be(false)
  end
end
