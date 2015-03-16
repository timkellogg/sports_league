class Game < ActiveRecord::Base
  belongs_to(:teams)
  belongs_to(:players)
end
