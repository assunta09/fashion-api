# Komplett übernommen von meiner Rails App!

class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	# before_action :authenticate_user!, except: [:index, :show]


	def index
  		# if params[:search].present? # check if somebody typed into searchbar
    # 		@products = Product.search(params[:search])
  		# else # if not show all active products

  		# Show all active products and suffle them to always show a different view
			@products = Product.where(active: true)
			@products.shuffle
  		# end
		json_response(@products)
	end

	def show # Product detail page
		json_response(@product)
		# @brand = Brand.find(@product.brand_id)
		# if current_user
		# 	@vote = Vote.where(votable_id: @product, voter_id: current_user.id).first # has the user voted on the product?
		# else
		# 	@vote = Vote.where(votable_id: @product).first #checks if there are any votes
		# end

		# if @product.active == false # if the product is not actie anymore, redirect to index
		# 	redirect_to root_url
		# end
	end


	def new 
		# if current_user.admin == true	# this view is only visable for users with the admin tag
		# 	@product = Product.new
		# else
		# 	redirect_to root_url
		# end
	end

	def create
		@product = Product.create!(product_params)
    	json_response(@product, :created)
	end

	def import # this method is used for Csv product import
   		# Product.import(params[:file])
    	# redirect_to users_admin_path, notice: "Products imported." # redirect to Admin page
  	end

	def edit
		# if current_user.admin == true	# only admins can edit pages
			
		# else
		# 	redirect_to root_url
		# end
	end

	def update
		# if @product.update(product_params)
		# 	redirect_to @product, notice: "Product was sucessfully updated"
		# else
		# 	render 'edit'
		# end
	end

	def destroy
		# if current_user.admin == true	 # only admins can edit pages			
		# 	@product.destroy
		# 	redirect_to users_admin_path
		# else
		# 	redirect_to root_url
		# end
	end

	def upvote # act as votable - like product
		# @product.upvote_by current_user
		# redirect_to :back
	end

	def downvote # act as votable - un-like product
		# @product.downvote_by current_user
		# redirect_to :back
	end

	private
	def product_params
		params.permit(:title, :description, :price, :link, :details, :active)

		# params.require(:product).permit(:image, :title, :description, :type_id, :brand_id, :price, :details, :active)
	end

	def find_product
		@product = Product.find(params[:id])
	end

end
