class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, presence: true

  def average
    return 0 if ratings.empty?
    ratings.map { |r| r.score }.sum / ratings.count.to_f
  end

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


