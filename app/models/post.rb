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

  # memcache key (without timestamp)
  def cache_key
    if new_record?
      "#{self.class.model_name.cache_key}/new"
    else
      "#{self.class.model_name.cache_key}/#{id}"
    end
  end

  # returns the cached comments if comments are cached,
  # otherwise gets comments from DB and caches and returns them
  def cached_comments
    Rails.cache.fetch([self, 'comments']) { comments.to_a }
  end

  # clear all cache belongs to self
  def flush_cache
    Rails.cache.delete([self, 'comments'])
  end
end
