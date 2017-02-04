class MoviesController < ApplicationController

  helper_method :collection, :resource

  def index
    respond_with(collection)
  end

  def new
    respond_with(resource)
  end

  def create
    movie = Movie.new(permitted_params)
    movie.actors = actor_ids.map { |id| Actor.find_or_create_by(person_id: id, movie_id: movie.id) }
    movie.save
    respond_with(movie)
  end

  def edit
    respond_with(resource)
  end

  def update
    actors = actor_ids.map { |id| Actor.find_or_create_by(person_id: id, movie_id: resource.id) }
    resource.update_attributes(permitted_params.merge(actors: actors))
    respond_with(resource)
  end

  def destroy
    resource.destroy
    respond_with resource
  end

  protected

  def collection
    @collection ||= Movie.all
  end

  def resource
    @resource ||= params[:id] ? Movie.find(params[:id]) : Movie.new
  end

  private

  def permitted_params
    params.require(:movie).permit(:title, :summary, director_attributes: [:id, :person_id], pictures_attributes: [:id, :file])
  end

  def actor_ids
    params[:movie][:actor_ids].reject{ |id| id.length == 0 }
  end
end
