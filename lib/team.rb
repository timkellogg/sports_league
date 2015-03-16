class Team < ActiveRecord::Base
  has_many(:players)
  has_many(:games)
  belongs_to(:league)
end
