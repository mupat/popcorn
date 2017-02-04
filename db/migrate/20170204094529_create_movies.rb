class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Movie.create_translation_table! :title => :string, :summary => :text
      end

      dir.down do
        Movie.drop_translation_table!
      end
    end
  end
end
