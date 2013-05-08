require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, FactoryGirl.create(:post))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(@post.user.username)
    expect(rendered).to match(@post.text)
    expect(rendered).to match(@post.url)
  end
end
