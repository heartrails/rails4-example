require 'spec_helper'

describe User do
  subject(:user){ FactoryGirl.create(:user) }
  describe "destroy" do
    it "also destroys my posts" do
      posts = FactoryGirl.create_list(:post, 2, user: user)
      user.destroy
      expect{posts[0].reload}.to raise_error ActiveRecord::RecordNotFound
      expect{posts[1].reload}.to raise_error ActiveRecord::RecordNotFound
    end
    it "also destroys comments on destroyed posts" do
      post = FactoryGirl.create(:post, user: user)
      comments = FactoryGirl.create_list(:comment, 2, post: post)
      user.destroy
      expect{comments[0].reload}.to raise_error ActiveRecord::RecordNotFound
      expect{comments[1].reload}.to raise_error ActiveRecord::RecordNotFound
    end
    it "also destroys my comments on other's posts" do
      comments = FactoryGirl.create_list(:comment, 2, user: user)
      user.destroy
      expect{comments[0].reload}.to raise_error ActiveRecord::RecordNotFound
      expect{comments[1].reload}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end