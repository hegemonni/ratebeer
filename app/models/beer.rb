class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  include RatingAverage
  
  def to_s
  	return "#{name}, #{brewery.name}"
  end

  def ratings_amount
  	ratings_amount = ratings.count
  	return ratings_amount
  end

    def total_score
  	total_score = []
  	for rating in ratings
  		total_score.push(rating.score)
  	end
  	return total_score
  end
end


