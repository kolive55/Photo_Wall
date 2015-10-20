class User < ActiveRecord::Base
  has_many :songs
  validates :user_name, presence: true
  validates :password, presence: true
end
