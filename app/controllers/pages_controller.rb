class PagesController < ApplicationController
  def index
    @home_page = true
    @trail_urls = retrieve_trail_urls(10)


  end

  def about
  end

  def help
  end

end
