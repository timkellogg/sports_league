class Game < ActiveRecord::Base
  belongs_to(:teams)
  belongs_to(:players)
  belongs_to(:schedules)
end
