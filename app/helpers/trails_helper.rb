module TrailsHelper
  def authorize(page)
    if @trail.editable?(current_user)
      render page
    else
      render 'unauthorized'
    end
  end

  def carousel_trails(number_of_trails)
    trails = Trail.last(number_of_trails)
    trail_arr = []
    trails.each_with_index do |trail, i|
      trail_url = trail.static_img_url(300, 400, maptype="satellite")
      trail_arr << [trail, trail_url]
    end
    trail_arr
  end

end