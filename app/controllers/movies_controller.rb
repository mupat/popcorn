class MoviesController < ApplicationController

  helper_method :collection, :resource

  def index
    respond_with(collection)
  end

  def new
    respond_with(resource)
  end

  def create
    @resource = Movie.create(permitted_params)
    respond_with(resource)
  end

  def edit
    respond_with(resource)
  end

  def update
    params = permitted_params.to_h
    actors = params.delete(:actor_ids).reject{ |id| id.length == 0 }.map { |id| Actor.find_or_create_by(person_id: id, movie_id: resource.id)}
    resource.update_attributes(params.merge(actors: actors))
    respond_with(resource)
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
    params.require(:movie).permit(:title, :summary, actor_ids: [], director_attributes: [:id, :person_id], pictures_attributes: [:id, :file])
  end
end
