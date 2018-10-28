require 'csv'
require 'fileutils'

module Pdfparser

	def test
		puts "you hit the PDFparser test method!"
	end


	@list = [
	{page: 3,	title: "Rolling in the Deep"},
	{page: 17,	title: "Rumour Has It"},
	{page: 11,	title: "Turning Tables"},
	{page: 24,	title: "Don't You Remember"},
	{page: 29,	title: "Set Fire to the Rain"},
	{page: 34,	title: "He Won't Go"},
	{page: 41,	title: "Take It All"},
	{page: 51,	title: "I'll Be Waiting"},
	{page: 57,	title: "One and Only"},
	{page: 46,	title: "Loverow"},
	{page: 63,	title: "Someone like You"}
]
	
@list25 = [
	{page: 1,	title: "Hello"},
	{page: 12,	title: "I Miss You"},
	{page: 19,	title: "When We Were Young"},
	{page: 27,	title: "Remedy"},
	{page: 33,	title: "Water Under the Bridge"},
	{page: 39,	title: "River Lea"},
	{page: 45,	title: "Love in the Dark"},
	{page: 50,	title: "Million Years Ago"},
	{page: 55,	title: "All I Ask"},
	{page: 61,	title: "Sweetest Devotion"},
	{page: 7,	title: "Send My Love (To Your New Lover)"}
]

# demo with hard coded folder
	def self.gs
		folder = Dir.chdir("/Users/brad/Dropbox/___2_Play/Collections/_Artists/Adele/adele25")
		files = Dir.glob("*.pdf")
		files.each do |f|
			page = f.split('_')[0]
			@list25.each do |row|
				if page.to_i == row[:page]
					File.rename(f, row[:title] + '.pdf')
				end
			end
		end
	end


	# def self.gs
	# 	folder = Dir.chdir("/Users/brad/Dropbox/___2_Play/Collections/_Artists/Adele/adele25")
	# 	files = Dir.glob("*.pdf")
	# 	files.each do |f|
	# 		page = f.split('_')[0]
	# 		@list25.each do |row|
	# 			if page.to_i == row[:page]
	# 				File.rename(f, row[:title] + '.pdf')
	# 			end
	# 		end
	# 	end
	# end
 
	# ======================================================================================================
	# set @index_files variable by iterating over 'lib/book-indices' folder
	def self.files(path=nil)
		path = "/Users/brad/dev/proj/music-db/lib/book-indices/"
		arr = []
		Dir.foreach(path) do |filename|
  		next if filename == '.' || filename == '..' || filename == '.git'
		  arr.push(filename)
		  File.open("#{path}/#{filename}", 'r')
			# file.close
		end
		@index_files = arr.sort
	end
	 
	# get the list of PDF file split points by extracting from CSV index file
	def self.list(file, factor)
		arr = []
		path = "/Users/brad/Dropbox/___2_Play/_LAB/book-indices/"

		CSV.foreach(path+file) do |row|
			arr.push(row[1].to_i + factor) if row[1]
		end
		arr
	end

	# create a destination sub-folder under "AllSplitFakeBooks" named with fakebook shorthand i.e. "Colorado Cookbook" foldername = "CCB"
	# use the 'list' generated with self.files, run the PDFsam basic app to split the PDF into separate files, populating the destination sub-folder
	
	# call the self.rename method with 2 arguments:
		# 1. pass in the sub-folder name (the one populated with auto-named pdf files, split from master pdf)
		# 2. pass in the associated index_file ("/Users/brad/Dropbox/___2_Play/_LAB/book-indices/" + index_file)
	
		def self.rename(folder, index_file)
		index = []
		CSV.foreach("/Users/brad/Dropbox/___2_Play/_LAB/book-indices/" + index_file) do |row|
			row_hash = Hash.new
			row_hash[:title] = row[0]
			row_hash[:page] = row[1].to_i
			index.push(row_hash)
		end
	
		
		Dir.chdir("/Users/brad/Dropbox/___2_Play/AllSplitFakeBooks/" + folder)
		files = Dir.glob("*.pdf")
		last_page = 0
		files.each do |f|
			src = "/Users/brad/Dropbox/___2_Play/AllSplitFakeBooks/" + folder + "/"
			dest = "/Users/brad/Dropbox/___2_Play/AllSplitFakeBooks/" + folder + "/asdf/"
			page = f.split('.')[0].to_i

			index.each do |row|
				files.each do |file|
					if row[:page].to_i == page && last_page = row[:page].to_i
						# FileUtils.cp(src + file, dest, preserve = false, dereference = true)
						FileUtils.cp(src + file, dest)
					 
					elsif row[:page].to_i == page
						File.rename(file, row[:title] + '.pdf')
						last_page = page
					end
				end
			end
		end
	end
end