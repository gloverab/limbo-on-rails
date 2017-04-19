class Avatar < ActiveRecord::Base

  def post_path
    "/users/#{self.id}/avatar_select"
  end

  def self.show_generic
    where(generic: true)
  end

end
