class MediasController < ApplicationController
  def delete_image
    Image.find(params[:image][:id]).destroy
    render nothing: true
  end

  def delete_audio
    Audio.find(params[:audio][:id]).destroy
    render nothing: true
  end

  def delete_video
    Video.find(params[:video][:id]).destroy
    render nothing: true
  end

  def delete_text
    Text.find(params[:text][:id]).destroy
    render nothing: true
  end
end
