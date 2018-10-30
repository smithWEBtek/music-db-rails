class SongsController < ApplicationController
	before_action :set_song, only: [:show, :update, :destroy, :docs, :collections]
	
	def index
		@songs = Song.all.sort { |a,b| a.title <=> b.title }
		respond_to do |format|
			format.html
			format.json
		end
	end
	
	def show

		respond_to do |format|
			format.html
			format.json
		end
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			render json: @song
		else
			render json: { errors: { message: 'song NOT created' }}
		end
	end

	def update
		@song.update(song_params)
		if @song.save
			render json: @song
		else
			render json: { errors: { message: 'song NOT updated' }}
		end
	end

	def destroy
		@song.delete
		render json: { message: 'song deleted' }
	end
	
	def docs
		@docs = @song.docs
		if @docs
			render json: @docs
		else
			render json: { errors: { message: 'song docs NOT found' }}
		end
	end
	
	def collections
		@collections = @song.collections
		if @collections
			render json: @collections
		else
			render json: { errors: { message: 'song collections NOT found' }}
		end
	end

	private
	def set_song
		@song = Song.find_by_id(params[:id])
		end
	def song_params
		params.require(:song).permit(:title)
	end
end
