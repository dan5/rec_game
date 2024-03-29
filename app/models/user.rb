class User < ActiveRecord::Base
  class UnAuthorized < Exception ; end

  attr_accessible :description, :mail, :url, :name, :summary, :categorys_text, :teams_text

  has_many :results, dependent: :destroy, :order => ['date desc', 'created_at desc']

  validates :name, :presence => true,
                   :length => { :maximum => 32}
  validates :mail, :length => { :maximum => 128}
  validates :summary, :length => { :maximum => 140}
  validates :description, :length => { :maximum => 2048}
  validates :categorys_text, :presence => true, :length => { :maximum => 512}
  validates :teams_text, :presence => true, :length => { :maximum => 512}

  def categorys
    categorys_text.split
  end

  def teams(category = nil)
    a = teams_text.split
    if category
      hash = {}
      a.each do |e|
        if e =~ /([^\s]+)::([^\s]+)/
          hash[$1] ||= []
          hash[$1] << $2 
        end
      end
      a = hash[category] if hash[category]
    end
    a.map {|e| e.sub(/[^\s]+::/, '') }
  end

  def category_results(category)
    if category.nil? or category == 'ALL'
      results
    else
      results.where(:category => category)
    end
  end
end
