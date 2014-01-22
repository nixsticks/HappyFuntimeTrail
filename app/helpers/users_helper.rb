module UsersHelper

  def on_trail?
    signed_in? && !current_user.current_trail_id.nil?
  end

end
