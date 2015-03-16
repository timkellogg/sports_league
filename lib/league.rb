class League < ActiveRecord::Base
  has_one(:schedule)
  has_many(:teams)
  has_many(:players)
end
