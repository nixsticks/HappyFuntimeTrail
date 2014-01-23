class MediasController < ApplicationController
  def delete_image
    Image.find(params[:image][:id]).destroy
    redirect_to :back
  end

  def delete_audio
    Audio.find(params[:audio][:id]).destroy
    redirect_to :back
  end

  def delete_video
    Audio.find(params[:video][:id]).destroy
    redirect_to :back
  end

  def delete_text
    Text.find(params[:text][:id]).destroy
    redirect_to :back
  end
end
