class Movie < ApplicationRecord
  translates :title, :summary

  has_many :pictures, as: :picturable, dependent: :destroy
  has_many :actors, dependent: :destroy
  has_one  :director, dependent: :destroy

  accepts_nested_attributes_for :director
  accepts_nested_attributes_for :pictures, reject_if: lambda { |attributes| attributes['file'].blank? }
end
