class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :actors
      t.string :imdb_id
      t.string :year
      t.string :rated
      t.string :runtime
      t.string :genre
      t.string :plot
      t.string :poster_url
      t.timestamps
    end
  end
end
