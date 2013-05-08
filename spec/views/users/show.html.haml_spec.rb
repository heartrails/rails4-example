require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(@user.username)
  end
end
