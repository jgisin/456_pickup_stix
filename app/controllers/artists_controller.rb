class ArtistsController < ApplicationController


  def show
    @artist = Artist.find(params[:id])
    @playlist_selection = PlaylistSelection.new
  end

  def index
    @artists = Artist.all
  end

end
