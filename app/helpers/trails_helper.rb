module TrailsHelper
  def authorize(page)
    if @trail.editable?(current_user)
      render page
    else
      render 'unauthorized'
    end
  end

  def retrieve_trail_urls(number_of_trails)
  trails = Trail.last(number_of_trails)
  urls = []
  urls = trails.collect do |trail|
    trail.static_img_url(200, 300)
  end

  urls
end