class SongSerializer < ActiveModel::Serializer
	attributes :id, :title, :categories, :resources
	has_many :resources
end
