class Resource < ApplicationRecord
	belongs_to :song, optional: true
end