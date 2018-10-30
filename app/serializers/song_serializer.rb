class SongSerializer < ActiveModel::Serializer
	attributes :id, :title, :categories, :docs
	has_many :docs
end
