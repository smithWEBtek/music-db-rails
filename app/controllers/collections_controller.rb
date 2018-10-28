class CollectionsController < ApplicationController
	before_action :set_collection, only: [:show, :update, :destroy]
 	
	def index
		@collections = Collection.all.sort { |a,b| a.name <=> b.name }
		render json: @collections
	end
 
	def show
		render json: @collection
	end

	def create
		@collection = Collection.new(collection_params)
		if @collection.save
			render json: @collection
		else
			render json: { errors: { message: 'collection NOT created' }}
		end
	end

	def update
		@collection.update(collection_params)
		if @collection.save
			render json: @collection
		else
			render json: { errors: { message: 'collection NOT updated' }}
		end
	end

	def destroy
		@collection.delete
		render json: { message: 'collection deleted' }
	end

	private
	def set_collection
		@collection = Collection.find_by_id(params[:id])
	end
	
	def collection_params
		params.require(:collection).permit(:name)
	end
end
