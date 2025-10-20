class Admin::SongsController < Admin::BaseController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.order(created_at: :desc)
  end

  def show; end

  def new
    @song = Song.new
  end

  def edit; end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to admin_song_path(@song), notice: 'Song created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @song.update(song_params)
      redirect_to admin_song_path(@song), notice: 'Song updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
    redirect_to admin_songs_path, notice: 'Song deleted.'
  end

  private

  def set_song
    @song = Song.find_by!(slug: params[:id]) rescue Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(
      :title, :slug,
      :spotify_url, :apple_music_url, :deezer_url, :tidal_url,
      :amazon_music_url, :youtube_music_url, :soundcloud_url,
      :image, :coming_soon, :release_date, :asset_image_name
    )
  end
end
