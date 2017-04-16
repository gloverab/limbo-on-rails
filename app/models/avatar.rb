class Avatar < ActiveRecord::Base

  def post_path
    "/users/#{self.id}/avatar_select"
  end

end
