class Result < ActiveRecord::Base
  attr_accessible :competition, :date, :note, :opp, :opp_score, :place, :score, :team
end
