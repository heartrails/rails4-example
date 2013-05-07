require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, FactoryGirl.build(:user))
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
        assert_select "input#user_username[name=?]", "user[username]"
        assert_select "input#user_crypted_password[name=?]", "user[crypted_password]"
        assert_select "input#user_salt[name=?]", "user[salt]"
    end
  end
end
