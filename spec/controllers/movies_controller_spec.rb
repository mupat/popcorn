require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { create(:movie) }
  let(:movie_data) { { text: 'test', summary: 'summary' } }

  describe '#index' do
    before { get :index }
    it { expect(response.status).to be 200 }
  end

  describe '#new' do
    before { get :new }
    it { expect(response.status).to be 200 }
  end

  describe '#edit' do
    before { get :edit, params: { id: movie.id } }
    it { expect(response.status).to be 200 }
  end

  describe '#create' do
    before { post :create, params: { movie: movie_data } }
    it { expect(response.status).to be 200 }
  end

  describe '#update' do
    before { patch :update, params: { id: movie.id, movie: movie_data } }
    it { expect(response.status).to be 302 }
  end

  describe '#delete' do
    before { delete :destroy, params: { id: movie.id } }
    it { expect(response.status).to be 302 }
  end

  describe '#collection' do
    subject { controller.send(:collection) }
    it { is_expected.to be_kind_of(ActiveRecord::Relation) }
  end

  describe '#resource' do
    subject { controller.send(:resource) }
    it { is_expected.to be_kind_of(Movie) }
  end
end
