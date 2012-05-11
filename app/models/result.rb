class Result < ActiveRecord::Base
  attr_accessible :category, :competition, :date, :note, :opp, :opp_score, :place, :score, :team, :win
  belongs_to :user
end
