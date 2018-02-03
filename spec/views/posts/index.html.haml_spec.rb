require 'rails_helper'

describe "posts/index" do
  before(:each) do
    @q = Post.search
    @posts = assign(:posts, Kaminari.paginate_array(FactoryBot.create_list(:post, 2)))
  end

  context "without login" do
    before do
      allow(controller).to receive(:current_user)
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
      allow(controller).to receive(:current_user).and_return(user)
      assign(:current_ability, Ability.new(user))
    end
    it "has one edit link" do
      render
      assert_select "a[href=?]", edit_post_path(@posts[0]), :count => 1
      assert_select "a[href=?]", edit_post_path(@posts[1]), :count => 0
    end
  end
end
