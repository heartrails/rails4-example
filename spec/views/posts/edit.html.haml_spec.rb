require 'rails_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, FactoryGirl.create(:post))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "textarea#post_text[name=?]", "post[text]"
      assert_select "input#post_url[name=?]", "post[url]"
    end
  end
end
