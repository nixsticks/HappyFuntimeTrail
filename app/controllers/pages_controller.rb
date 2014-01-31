class PagesController < ApplicationController
  def index
    @home_page = true
    @trail_urls = trail_urls_last(12).each_slice(3).to_a


  end

  def about
  end

  def help
  end

end
