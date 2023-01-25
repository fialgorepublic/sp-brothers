class Api::V1::VideosController < Api::BaseController
  before_action :find_video, only: [:show, :destroy]
  
  def index
    @videos = Video.all
    json_success_response("All Videos", @videos)
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      json_success_response("Video created", @video)
      else
        json_error_response('something went wrong', @video.errors.full_messages)
    end
  end

  def show
    json_success_response("Video detail", @video)
  end

  def destroy
    if @video.destroy
      json_success_response("Video deleted", @video)
    end
  end

  private

  def video_params
    params.permit(:title, :url)
  end

  def find_video
    @video = Video.find(params[:id])
  end

  
end