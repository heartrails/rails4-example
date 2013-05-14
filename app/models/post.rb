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

  validates :user, presence: true
  validates :text, presence: true, length: 1..300
  validates :url, url_format: true
end
