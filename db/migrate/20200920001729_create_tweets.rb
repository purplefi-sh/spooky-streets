class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :twitter_id
      t.string :text
      t.string :location_string
      t.st_point :location_point
    end
  end
end
