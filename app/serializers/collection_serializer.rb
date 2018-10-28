class CollectionSerializer < ActiveModel::Serializer
	attributes :id, :name, :songs, :resources

	has_many :songs
	has_many :resources, through: :songs

end
