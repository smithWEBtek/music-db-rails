class SongCollectionSerializer < ActiveModel::Serializer
	attributes :id, :songs, :resources
	has_many :song_collections
	has_many :songs, through: :song_collections
	has_many :resources, through: :songs

end
