class Contributor < ApplicationRecord
  belongs_to :movie
  belongs_to :person

  delegate :name, to: :person
  delegate :first_name, to: :person
  delegate :last_name, to: :person
end
