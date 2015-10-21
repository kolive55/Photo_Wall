class Song < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :song_title, presence: true
  validates :author, presence: true
end
