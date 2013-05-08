class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: 1..140
end
