class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
			t.integer :song_id
      t.string :name
      t.string :description
      t.string :format
			t.string :location
    end
  end
end
