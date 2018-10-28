# Requirements


## Data Model
	Song
		:title, :category_ids, :resources

		has_many :resources
		has_many :song_categories
		has_many :categories, through: :song_categories

		has_many :song_collections
		has_many :collections, through: :song_collections


	Category
		:name
		has_many :song_categories
		has_many :songs, through: :song_categories

		class CreateCategories < ActiveRecord::Migration[5.2]
			def change
				create_table :categories do |t|
					t.string :name
				end
			end
		end


	Resource
		NOTES: a file(multiple formats), url or Object that belongs to a single Song object

		belongs_to :song

		:song_id, :name, :description, :format, :location
		
		class CreateResources < ActiveRecord::Migration[5.1]
		def change
			create_table :resources do |t|
				t.string :title
				t.string :category
				t.string :description
				t.string :format
				t.string :location
				t.string :url, default: 'no_url_given'
				t.timestamps
			end
		end
	end

	Collection
		NOTES: a collection of songs for any reason (gig, band, concert, lesson, student)

		:name, :song_ids

		has_many :songs
		has_many :resources, through: :songs

	SongCollection
		belongs_to :song
		belongs_to :collection

## Features
###	Song
		First you create a Song.
		Everything relates to a Song in some way. 
		
		Client
			New				present form with local state, submit to: onCreate(data)
			Edit			present form with local state populated by fetchOne(id)
			FetchAll 	fetchAll()
			FetchOne	fetchOne(id)
			DeleteOne deleteOne(id)

		API 						
			Create		'songs#create'
			Update		'songs#update'
			Show			'songs#show'
			Delete		'songs#delete'

###	Collection
		First you create a Collection.
		Select Song(s) to populate the Collection. 
		Sort the Collection.
		Link to SongResources component, pass in SongId
		Link to SongShow component, pass in SongId
		Link to SongAdd form, local state blank

		Client
			New				present form with local state, submit to: onCreate(data)
			Edit			present form with local state populated by fetchOne(id)
			FetchAll 	fetchAll()
			FetchOne	fetchOne(id)
			DeleteOne deleteOne(id)

		API 						
			Create		'collections#create'
			Update		'collections#update'
			Show			'collections#show'
			Delete		'collections#delete'

###	Resource
		Client: 	New, Edit, FetchAll, FetchOne, DeleteOne
		API: Create, Update, Show, Delete 






	Auto search and create chord charts for Song(s) in a Collection
	Parse PDF fakebook into separate PDF files
	Phone interface for the App
