require 'rails_helper'

describe "users/new" do
  before(:each) do
    assign(:user, FactoryGirl.build(:user))
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
        assert_select "input#user_username[name=?]", "user[username]"
        assert_select "input#user_password[name=?]", "user[password]"
        assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
