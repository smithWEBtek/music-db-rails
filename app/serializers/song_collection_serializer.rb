class SongCollectionSerializer < ActiveModel::Serializer
	attributes :id, :songs, :docs
	has_many :song_collections
	has_many :songs, through: :song_collections
	has_many :docs, through: :songs

end
