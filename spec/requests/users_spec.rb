require 'spec_helper'

describe "Users" do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_path(@user.to_param)
      expect(response.status).to be(200)
    end
  end
end
