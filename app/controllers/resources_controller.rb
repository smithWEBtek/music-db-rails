class ResourcesController < ApplicationController
	before_action :set_resource, only: [:show, :update, :destroy]
 	
	def index
		@resources = Resource.all.sort { |a,b| a.name <=> b.name }
		render json: @resources
	end
 
	def show
		render json: @resource
	end

	def create
		@resource = Resource.new(resource_params)
		if @resource.save
			render json: @resource
		else
			render json: { errors: { message: 'resource NOT created' }}
		end
	end

	def update
		@resource.update(resource_params)
		if @resource.save
			render json: @resource
		else
			render json: { errors: { message: 'resource NOT updated' }}
		end
	end

	def destroy
		@resource.delete
		render json: { message: 'resource deleted' }
	end

	def books
		@resources = Resource.all.select {|r| r.format == 'pdf-book'}
		render json: @resources 
	end

	private
	def set_resource
		@resource = Resource.find_by_id(params[:id])
		end
	def resource_params
		params.require(:resource).permit(:name, :format, :song_id, :description, :location)
	end
end
