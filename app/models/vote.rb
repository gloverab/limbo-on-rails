class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :decision
  # belongs_to :option
end
