require 'spec_helper'

describe User do
  subject(:user){ FactoryGirl.create(:user) }
  describe "password validation" do
    context "on create" do
      it "fail if length is 5" do
        user = FactoryGirl.build(:user, password: "hogeh")
        expect(user.save).to be_false
        expect(user.errors[:password]).not_to be_nil
      end
    end
    context "on update" do
      it "success if no password set" do
        password_digest = user.password_digest
        user2 = User.find_by!(id: user.id) # clear @password
        user2.update_attributes(password: "", password_confirmation: "", username:"updated")
        expect(user2.errors.messages).to eq({})
        expect(user2.password_digest).to eql(password_digest)
        expect(user2.username).to eql("updated")
      end
      it "success with valid password and confirmation" do
        user.assign_attributes(password: "hogeho", password_confirmation: "hogeho")
        expect(user.save).to be_true
      end
      it "fail if confirmation is invalid" do
        user.assign_attributes(password: "hogeho", password_confirmation: "")
        expect(user.save).to be_false
        expect(user.errors[:password]).not_to be_nil
      end
      it "fail if length is 5" do
        user.assign_attributes(password: "hogeh", password_confirmation: "hogeh")
        expect(user.save).to be_false
        expect(user.errors[:password]).not_to be_nil
      end
    end
  end
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