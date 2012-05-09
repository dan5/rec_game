class User < ActiveRecord::Base
  class UnAuthorized < Exception ; end

  attr_accessible :description, :mail, :url, :name, :summary, :categorys_text, :teams_text
  has_many :results

  def categorys
    categorys_text.split
  end

  def teams
    teams_text.split
  end

  def category_results(category)
    if category == 'ALL'
      results
    else
      results.where(:category => category)
    end
  end
end
