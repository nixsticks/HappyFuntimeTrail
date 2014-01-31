class PagesController < ApplicationController
  def index
    @home_page = true
    @carousel_trails = carousel_trails(12) # returns an array with nested arrays that contain the trail object and the trail static img url for that trail
    @trails_triplets = @carousel_trails.each_slice(3).to_a
  end

  def about
  end

  def help
  end

end
