class CreateContributors < ActiveRecord::Migration[5.0]
  def change
    create_table :contributors do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :person, index: true
      t.string :type
      t.timestamps
    end
  end
end
