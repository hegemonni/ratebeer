module RatingAverage
	extend ActiveSupport::Concern
	
	def average_rating
		average = total_score.inject { |sum, n| sum + n}.to_f / ratings_amount
	  	return average
  	end

  	def total_score
  	total_score = []
  		for rating in ratings
  			total_score.push(rating.score)
  		end
  	return total_score
  	end

  	def ratings_amount
  		ratings_amount = 0
  		for rating in ratings
  			ratings_amount = ratings_amount + 1
  		end
  		return ratings_amount
  	end
end



