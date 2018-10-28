class Song < ApplicationRecord
	has_many :song_categories
	has_many :categories, through: :song_categories
	has_many :resources
	
	has_many :song_collections
	has_many :collections, through: :song_collections

end
