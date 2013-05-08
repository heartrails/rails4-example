require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, FactoryGirl.build(:post))
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
        assert_select "textarea#post_text[name=?]", "post[text]"
        assert_select "input#post_url[name=?]", "post[url]"
    end
  end
end
