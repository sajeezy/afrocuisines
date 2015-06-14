class ReceipesController < ApplicationController
	before_action :find_receipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@receipe = Receipe.all.order("created_at DESC")
	end

	def show

	end

	def new
		@receipe = current_user.receipes.build
	end

	def create
		@receipe = current_user.receipes.build(receipe_params)

		if @receipe.save
			redirect_to @receipe, notice: 'Successfully created new afrocuisine'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @receipe.update(receipe_params)
        format.html { redirect_to @receipe, notice: 'receipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipe }
      else
        format.html { render :edit }
        format.json { render json: @receipe.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@receipe.destroy
		respond_to do |format|
		format.html { redirect_to root_path, notice: "Successfully deleted receipe" }
      	format.json { head :no_content }
		end
    end

	private 

	def receipe_params
		params.require(:receipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :destroy], instructions_attributes: [:id,:step,:destroy])
	end

	def find_receipe
		@receipe = Receipe.find(params[:id])
	end
end
