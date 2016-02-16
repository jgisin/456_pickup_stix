class PlaylistSelectionsController < ApplicationController

  before_action :require_current_user, :only => [:create, :destroy]

  def create
    @playlist_selection = PlaylistSelection.new(play_param)
    if @playlist_selection.save
      flash.now[:success] = "Playlist Selection saved"
      redirect_to :back
    else
      flash[:error] = "Playlist Selection not saved"
      redirect_to :back
    end
  end

  def destroy

  end

  private

  def play_param
    params.require(:playlist_selection).permit(:song_id, :playlist_id)
  end
end
