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

  describe '#cached_comments' do
    before do
      @post = FactoryGirl.create(:post)
      @post.flush_cache
      @comments = FactoryGirl.create_list(:comment, 2, post: @post).sort_by(&:id)
    end
    context 'before caching' do
      it 'gets comments from DB' do
        @post.should_receive(:comments).once
        @post.cached_comments
      end
      it 'stores comments into cache' do
        expect(Rails.cache.read([@post, 'comments'])).to be_blank
        @post.cached_comments
        expect(Rails.cache.read([@post, 'comments'])).to be_present
      end
    end
    context 'after caching' do
      before do
        @post.cached_comments
        @post = Post.find(@post.id)
      end
      it 'gets comments from cache' do
        @post.should_receive(:comments).never
        @post.cached_comments
      end
      it 'returns correct comments' do
        expect(@post.cached_comments.sort_by(&:id)).to eq(@comments)
      end

      it "doesn't clear cache when updated" do
        @post.updated_at = Time.now
        @post.save
        expect(Rails.cache.read([@post, 'comments'])).to be_present
      end
      it 'clears cache when another comment are added' do
        FactoryGirl.create(:comment, post: @post)
        expect(Rails.cache.read([@post, 'comments'])).to be_blank
      end
      it 'clears cache when one of the comments is destoryed' do
        @comments[rand(@comments.size)].destroy
        expect(Rails.cache.read([@post, 'comments'])).to be_blank
      end
      it 'clears cache when one of the comments is updated' do
        @comments[rand(@comments.size)].update_attribute(:body, 'updated body')
        expect(Rails.cache.read([@post, 'comments'])).to be_blank
      end
    end
  end
end
