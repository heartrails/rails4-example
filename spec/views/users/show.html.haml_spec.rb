require 'rails_helper'

describe "users/show" do
  subject { render; response.body }
  let(:current_user){ FactoryGirl.create(:user) }
  before do
    allow(controller).to receive(:current_user).and_return(current_user)
    allow(view).to receive(:current_user).and_return(current_user)
    assign(:current_ability, Ability.new(current_user))

    assign(:user, user)
  end

  context "login user" do
    let(:user){ current_user }
    it { expect(view.can?(:update, user)).to eq true }
    it { should have_xpath "//a[@href='#{edit_user_path(user)}']" }
  end

  context "another user" do
    let(:user){ FactoryGirl.create(:user) }
    it { should_not have_xpath "//a[contains(@href,'/edit')]" }
  end
end
