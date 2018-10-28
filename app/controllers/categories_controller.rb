class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :update, :destroy]
 	
	def index
		@categories = Category.all.sort { |a,b| a.name <=> b.name }
		respond_to do |format|
			format.html
			format.json
		end
	end
 
	def show
		render json: @category
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			render json: @category
		else
			render json: { errors: { message: 'category NOT created' }}
		end
	end

	def update
		@category.update(category_params)
		if @category.save
			render json: @category
		else
			render json: { errors: { message: 'category NOT updated' }}
		end
	end

	def destroy
		@category.delete
		render json: { message: 'category deleted' }
	end

	private
	def set_category
		@category = Category.find_by_id(params[:id])
	end
	
	def category_params
		params.require(:category).permit(:name)
	end
end
