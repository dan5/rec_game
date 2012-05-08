class User < ActiveRecord::Base
  attr_accessible :description, :mail, :name, :summary
  has_many :results
end
