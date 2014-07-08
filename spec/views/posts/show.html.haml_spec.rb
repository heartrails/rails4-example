require 'rails_helper'

describe "posts/show" do
  subject { render; response.body }
  let(:current_user){ FactoryGirl.create(:user) }
  let(:post){ FactoryGirl.create(:post) }
  before do
    Rails.cache.clear
    allow(controller).to receive(:current_user).and_return(current_user)
    allow(view).to receive(:current_user).and_return(current_user)
    assign(:current_ability, Ability.new(current_user))

    assign(:post, post)
  end

  it { should match(post.user.username) }

  context "owned by login user" do
    let(:post){ FactoryGirl.create(:post, user: current_user) }
    it { should have_xpath "//a[@href='#{edit_post_path(post)}']" }
  end

  context "owned by another user" do
    it { should_not have_xpath "//a[contains(@href,'/edit')]" }
  end

  describe "comments" do
    before do
      FactoryGirl.create_list(:comment, 3, post: post)
      FactoryGirl.create_list(:comment, 2, post: post, user: current_user)
    end
    it { should have_xpath "//a[contains(@href,'/comments/')][contains(@href,'/edit')]", count: 2 }
  end
end
