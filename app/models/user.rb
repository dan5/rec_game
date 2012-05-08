class User < ActiveRecord::Base
  attr_accessible :description, :login, :name, :summary
end
