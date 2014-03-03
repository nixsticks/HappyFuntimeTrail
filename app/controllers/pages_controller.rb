class PagesController < ApplicationController
  def index
    @home_page = true
    @sample_trails = carousel_trails(3) # returns an array with nested arrays that contain the trail object and the trail static img url for that trail
  end

  def about
  end

  def help
  end

end
