module PinsHelper
  def increment_stepnumber(array)
    trail = self.trail
    index = array.index(self)
    self.update_attribute(:stepnumber, index)
  end
end
