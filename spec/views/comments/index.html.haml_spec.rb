require 'spec_helper'

describe "comments/index" do
  before(:each) do
    assign(:comments, FactoryGirl.create_list(:comment, 2))
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
