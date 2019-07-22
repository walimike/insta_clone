require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a name" do
    user = User.new()
    expect(user).to_not be_valid
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

  # it "is not valid without an email"
  # it "is not valid without a start_date"
  # it "is not valid without a end_date"
end
