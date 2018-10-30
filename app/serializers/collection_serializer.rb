class CollectionSerializer < ActiveModel::Serializer
	attributes :id, :name, :songs, :docs

	has_many :songs
	has_many :docs, through: :songs

end
