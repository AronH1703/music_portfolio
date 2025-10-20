class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.order(created_at: :desc)
  end

  def show; end

  def new
    @video = Video.new
  end

  def edit; end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_video_path(@video), notice: 'Video created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @video.update(video_params)
      redirect_to admin_video_path(@video), notice: 'Video updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @video.destroy
    redirect_to admin_videos_path, notice: 'Video deleted.'
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :youtube_url, :image)
  end
end

