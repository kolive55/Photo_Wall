class User < ActiveRecord::Base
  has_many :songs
  has_many :likes
  validates :user_name, presence: true
  validates :password, presence: true
end
