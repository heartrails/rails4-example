require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, FactoryGirl.build(:comment))
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
        assert_select "input#comment_user_id[name=?]", "comment[user_id]"
        assert_select "input#comment_post_id[name=?]", "comment[post_id]"
        assert_select "input#comment_body[name=?]", "comment[body]"
    end
  end
end
