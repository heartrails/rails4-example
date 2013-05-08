require 'spec_helper'

describe "Comments" do
  before do
    @post = FactoryGirl.create(:post)
  end
  describe "GET /comments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get new_post_comment_path(@post.to_param)
      expect(response.status).to be(200)
    end
  end
end
