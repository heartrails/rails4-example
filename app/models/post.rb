class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :text, presence: true, length: 1..300
  validates :url, url_format: true
end
