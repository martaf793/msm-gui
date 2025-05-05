class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
  def new
    m=Movie.new
    m.title=params.fetch("title")
    m.year=params.fetch("year")
    m.duration=params.fetch("duration")
    m.description=params.fetch("description")
    m.image=params.fetch("image")
    m.director_id=params.fetch("director")
    m.save

    redirect_to("/movies")
  end
  def delete
    the_id=params.fetch("path_id")
    matching_rec=Movie.where({:id=>the_id})
    the_movie=matching_rec.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end
  def update
    the_id=params.fetch("path_id")
    matching_rec=Movie.where({:id=>the_id})
    the_movie=matching_rec.at(0)
    the_movie.title=params.fetch("title")
    the_movie.year=params.fetch("year")
    the_movie.duration=params.fetch("duration")
    the_movie.description=params.fetch("description")
    the_movie.image=params.fetch("image")
    the_movie.director_id=params.fetch("director")
    the_movie.save
    redirect_to("/movies/#{the_movie.id}")
  end
end
