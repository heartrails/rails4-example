# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: 3..12, format: /\A[a-z0-9_.]+\z/
  validates :password, length: { minimum: 6 }, allow_blank: true

  # https://github.com/rails/rails/commit/8c1687bbf8dd518d64fc7180b33c1cb57f29a69a
  def password_confirmation=(unencrypted_password)
    unless unencrypted_password.blank?
      @password_confirmation = unencrypted_password
    end
  end
end
