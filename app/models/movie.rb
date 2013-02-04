class Movie < ActiveRecord::Base
  
  def self.all_ratings
    ['G','PG','PG-13','R']
  end
  
  def self.select_movies(sort_by_movie, sort_by_date, previous_rating_params)
    movies = Movie.where(rating: previous_rating_params.keys) if !previous_rating_params.nil?
    if movies
      sort_by_movie == true ? movies.order('title') : (sort_by_date == true ? movies.order('release_date') : movies.all)
    else
      sort_by_movie == true ? Movie.order('title') : (sort_by_date == true ? Movie.order('release_date') : Movie.all)
    end
  end
  
end
