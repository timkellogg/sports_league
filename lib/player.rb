class Player < ActiveRecord::Base
  belongs_to(:team)
  has_many(:games)
  belongs_to(:league)
end

