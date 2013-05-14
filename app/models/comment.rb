class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true, length: 1..140

  after_commit do
    post.expire_cache(:comments)
  end
end
