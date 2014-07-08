require 'rails_helper'

describe "layouts/application" do
  subject { render; response.body }
  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(view).to receive(:current_user).and_return(user)
  end

  context "without login" do
    let(:user){ nil }
    it { should have_xpath "//a[@href='#{new_sessions_path}']" }
    it { should_not have_xpath "//a[@href='#{sessions_path}']" }
    it { should_not have_xpath "//a[@href='#{new_post_path}']" }
  end

  context "with login" do
    let(:user){ FactoryGirl.create(:user) }
    it { should_not have_xpath "//a[@href='#{new_sessions_path}']" }
    it { should have_xpath "//a[@href='#{sessions_path}']" }
    it { should have_xpath "//a[@href='#{new_post_path}']" }
  end
end
