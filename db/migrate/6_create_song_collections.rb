class CreateSongCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :song_collections do |t|
			t.integer :song_id
			t.integer :collection_id
    end
  end
end
