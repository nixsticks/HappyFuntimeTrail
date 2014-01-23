module TrailsHelper
  def authorize(page)
    if @trail.editable?(current_user)
      render page
    else
      render 'unauthorized'
    end
  end
end
