require 'rails_helper'

describe "comments/new" do
  before(:each) do
    @post = assign(:post,    FactoryGirl.create(:post))
    assign(:comment, FactoryGirl.build(:comment))
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_comments_path(@post), "post" do
        assert_select "input#comment_body[name=?]", "comment[body]"
    end
  end
end
