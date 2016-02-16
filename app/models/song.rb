class Song < ActiveRecord::Base

  belongs_to :artist

  has_many :playlist_selections, dependent: :destroy
  has_many :playlists, :through => :playlist_selections
  has_many :bookmarks, :as => :bookmarkable, dependent: :destroy

  validates :name, :presence => true
  validates :artist, :presence => true
end
