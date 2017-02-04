class MoviesController < ApplicationController

  helper_method :collection, :resource

  def index
    respond_with(collection)
  end

  def new
    respond_with(resource)
  end

  def create
    create_resource
    resource.actors = actors(resource.id)
    resource.save
    respond_with(resource)
  end

  def edit
    respond_with(resource)
  end

  def update
    resource.update_attributes(permitted_params.merge(actors: actors(resource.id)))
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

  def create_resource
    @resource = Movie.new(permitted_params)
  end

  private

  def permitted_params
    params.require(:movie).permit(:title, :summary, director_attributes: [:id, :person_id], pictures_attributes: [:id, :file])
  end

  def actors(movie_id)
    actor_ids.map { |id| Actor.find_or_create_by(person_id: id, movie_id: movie_id) }
  end

  def actor_ids
    (ids = params[:movie][:actor_ids]) ? ids.reject{ |id| id.length == 0 } : []
  end
end
