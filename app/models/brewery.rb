class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validates :year, numericality: { only_integer: true }
  validate :year_must_be_current_or_past

  include RatingAverage

  def year_must_be_current_or_past
    if year <= 1042 or year > (Date.today + 1).year
      errors.add(:year, "cannot be in the future or older than 1042")
    end
  end

  def print_report
  	puts name
  	puts "established at year #{year}"
  	puts "number of beers #{beers.count}"
  end

  def restart
  	self.year = 2016
  	puts "changed year to #{year}"
  end

  def ratings_amount
  	ratings_amount = 0
  	for beer in beers
  		for rating in ratings
  			ratings_amount = ratings_amount + 1
  		end
  	end
  	return ratings_amount
  end

  def total_score
  	total_score = []
  	for beer in beers
  		for rating in ratings
  			total_score.push(rating.score)
  		end
  	end
  	return total_score
  end

end