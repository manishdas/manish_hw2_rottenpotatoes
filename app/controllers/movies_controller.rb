class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @sort_by_movie = params[:sort_by_movie].present? ? eval(params[:sort_by_movie]) : false
    @sort_by_date = params[:sort_by_date].present? ? eval(params[:sort_by_date]) : false
    @movies = Movie.select_movies(@sort_by_movie, @sort_by_date, session[:previous_rating_params])
    @all_ratings = Movie.all_ratings
    @checked_ratings = session[:previous_rating_params].nil? ? Movie.all_ratings : session[:previous_rating_params].keys
    if params[:ratings].present?
      session[:previous_rating_params] = params[:ratings]
      @movies = Movie.where(rating: params[:ratings].keys)
      @checked_ratings = params[:ratings].keys
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
