class User < ActiveRecord::Base
  class UnAuthorized < Exception ; end

  attr_accessible :description, :mail, :name, :summary
  has_many :results
end
