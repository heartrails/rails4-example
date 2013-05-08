require 'spec_helper'

describe "comments/new" do
  before(:each) do
    @post = assign(:post,    FactoryGirl.create(:post))
    assign(:comment, FactoryGirl.build(:comment))
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_comments_path(@post), "post" do
        assert_select "select#comment_user_id[name=?]", "comment[user_id]"
        assert_select "select#comment_post_id[name=?]", "comment[post_id]"
        assert_select "input#comment_body[name=?]", "comment[body]"
    end
  end
end
