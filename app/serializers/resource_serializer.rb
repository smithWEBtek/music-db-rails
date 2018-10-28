class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :song_id, :name, :description, :format, :location

end