require 'rails_helper'

describe "Comments" do
  before do
    @post = FactoryBot.create(:post)
  end
  describe "GET /posts/:post_id/comments/new" do
    it "works! (now write some real specs)" do
      post sessions_path(user: {username: @post.user.username, password: @post.user.password})
      get new_post_comment_path(@post.to_param)
      expect(response.status).to be(200)
    end
  end
end
