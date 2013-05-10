require 'spec_helper'

describe "Posts" do
  before do
    @post = FactoryGirl.create(:post)
  end
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      expect(response.status).to be(200)
    end
  end
  describe "JSON" do
    subject(:json){ JSON::parse(response.body) }
    describe "GET /posts.json" do
      before { get posts_path(format: :json) }
      it { expect(subject[0]['link']).to eq(post_url(@post, format: :json)) }
    end
    describe "GET /posts/:id.json" do
      before { get post_path(@post, format: :json) }
      it { expect(subject['link']).to eq(post_url(@post, format: :json)) }
    end
    describe "GET /posts/new.json" do
      before { post sessions_path(user: {username: @post.user.username, password: @post.user.password}) }
      subject { get new_post_path(format: :json) }
      it { expect{subject}.to raise_error ActionController::UnknownFormat}
    end
  end
  describe "XML" do
    describe "GET /posts.xml" do
      subject { get posts_path(format: :xml) }
      it { expect{subject}.to raise_error ActionController::UnknownFormat}
    end
    describe "GET /posts/new.xml" do
      before { post sessions_path(user: {username: @post.user.username, password: @post.user.password}) }
      subject { get new_post_path(format: :xml) }
      it { expect{subject}.to raise_error ActionController::UnknownFormat}
    end
  end
end
