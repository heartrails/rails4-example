require 'spec_helper'

describe Post do
  subject(:post){ FactoryGirl.create(:post) }
  describe "destroy" do
    it "also destroys comments" do
      comments = FactoryGirl.create_list(:comment, 2, post: post)
      post.destroy
      expect{comments[0].reload}.to raise_error ActiveRecord::RecordNotFound
      expect{comments[1].reload}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
