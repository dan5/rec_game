class User < ActiveRecord::Base
  class UnAuthorized < Exception ; end

  attr_accessible :description, :mail, :url, :name, :summary, :categorys_text
  has_many :results

  def categorys
    categorys_text.split
  end
end
