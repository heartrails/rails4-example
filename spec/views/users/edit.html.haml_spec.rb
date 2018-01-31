require 'rails_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      #assert_select "input#user_password[name=?]", "user[password]"
      #assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
