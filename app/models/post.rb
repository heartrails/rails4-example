# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  text           :text
#  url            :string(255)
#  comments_count :integer          default(0), not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_cached(version: 1, expires_in: 1.day)

  validates :user, presence: true
  validates :text, presence: true, length: 1..300
  validates :url, url_format: true

  def cached_comments
    cached(:comments)
  end
end
