class PagesController < ApplicationController
  def index
    @home_page = true
  end

  def about
  end

  def help
  end

  def test
    render "pages/test"
  end

end
