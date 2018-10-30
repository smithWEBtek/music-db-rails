class DocsController < ApplicationController
	before_action :set_doc, only: [:show, :update, :destroy]
 	
	def index
		@docs = Doc.all.sort { |a,b| a.name <=> b.name }
		respond_to do |format|
			format.html
			format.json
		end
	end
 
	def show
		render json: @doc
	end

	def create
		@doc = Doc.new(doc_params)
		if @doc.save
			render json: @doc
		else
			render json: { errors: { message: 'doc NOT created' }}
		end
	end

	def update
		@doc.update(doc_params)
		if @doc.save
			render json: @doc
		else
			render json: { errors: { message: 'doc NOT updated' }}
		end
	end

	def destroy
		@doc.delete
		render json: { message: 'doc deleted' }
	end

	def books
		@docs = Doc.all.select {|r| r.format == 'pdf-book'}
		render json: @docs 
	end

	private
	def set_doc
		@doc = Doc.find_by_id(params[:id])
		end
	def doc_params
		params.require(:doc).permit(:name, :format, :song_id, :description, :location)
	end
end
