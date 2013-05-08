require 'spec_helper'

describe "layouts/application" do
  subject { render; response.body }
  before do
    controller.stub(current_user: user)
    view.stub(current_user: user)
  end

  context "without login" do
    let(:user){ nil }
    it { should have_selector :a, href: new_sessions_path }
    it { should_not have_selector :a, href: sessions_path }
    it { should_not have_selector :a, href: new_post_path }
  end

  context "with login" do
    let(:user){ FactoryGirl.create(:user) }
    it { should_not have_selector :a, href: new_sessions_path }
    it { should have_selector :a, href: sessions_path }
    it { should have_selector :a, href: new_post_path }
  end
end
