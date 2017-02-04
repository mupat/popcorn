class Movie < ApplicationRecord
  translates :title, :summary

  has_many :pictures, as: :picturable
  has_many :actors
  has_one  :director
end
