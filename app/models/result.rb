class Result < ActiveRecord::Base
  attr_accessible :category, :competition, :date, :note, :opp, :opp_score, :place, :score, :team
  belongs_to :user
end
