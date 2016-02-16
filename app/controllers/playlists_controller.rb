class PlaylistsController < ApplicationController
  before_action :require_login, :only => [:edit, :create, :destroy]
  before_action :require_current_user, :only => [:create, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      flash[:success] = "Playlist Created"
      redirect_to playlists_path
    else
      flash[:error] = "Playlist Not Created"
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def destroy

  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end
end
