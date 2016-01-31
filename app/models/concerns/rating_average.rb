module RatingAverage
	extend ActiveSupport::Concern
	
	def average_rating
		average = total_score.inject { |sum, n| sum + n}.to_f / ratings_amount
	  	return average
  	end
end



