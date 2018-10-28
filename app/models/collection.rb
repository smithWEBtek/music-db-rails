class Collection < ApplicationRecord
	has_many :song_collections
	has_many :songs, through: :song_collections
	has_many :resources, through: :songs
end
