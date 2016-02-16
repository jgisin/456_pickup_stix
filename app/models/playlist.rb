class Playlist < ActiveRecord::Base

  belongs_to :user
  has_many :playlist_selections,
           :dependent => :destroy

  has_many :songs, :through => :playlist_selections

  has_many :bookmarks, :as => :bookmarkable, dependent: :destroy

  validates :name, :presence => true
  validates :user, :presence => true
end
