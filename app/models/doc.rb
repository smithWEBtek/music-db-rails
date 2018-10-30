class Doc < ApplicationRecord
	belongs_to :song, optional: true
end