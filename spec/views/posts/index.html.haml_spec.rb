require 'spec_helper'

describe "posts/index" do
  before(:each) do
    @q = Post.search
    @posts = assign(:posts, Kaminari.paginate_array(FactoryGirl.create_list(:post, 2)))
  end

  context "without login" do
    before do
      controller.stub(current_user: nil)
    end
    it "has no edit button" do
      render
      assert_select "table tr", :count => 3
      assert_select "a[href=?]", edit_post_path(@posts[0]), :count => 0
      assert_select "a[href=?]", edit_post_path(@posts[1]), :count => 0
    end
  end
  context "with login" do
    before do
      user = @posts[0].user
      controller.stub(current_user: user)
      assign(:current_ability, Ability.new(user))
    end
    it "has one edit link" do
      render
      assert_select "a[href=?]", edit_post_path(@posts[0]), :count => 1
      assert_select "a[href=?]", edit_post_path(@posts[1]), :count => 0
    end
  end
end
