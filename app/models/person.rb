class Person < ApplicationRecord
  self.table_name = :persons
  has_many :contributors
  has_many :actors
  has_many :directors

  validates :first_name, :last_name, presence: true

  def name
    @name ||= [first_name, last_name].join(' ')
  end
end
