class Client::RecipesController < ApplicationController

	def index
		@recipes = Unirest.get("http://localhost:3000/api/recipes/").body
		render "index.html.erb"
	end

	def show
		recipe = Unirest.get("http://localhost:3000/api/recipes/#{params[:id]}")
		@recipe = recipe.body
		render 'show.html.erb'
	end

	def new
		render 'new.html.erb'
	end

	def create
		client_params = {
			title: params[:title],
			chef: params[:chef],
			ingredients: params[:ingredients],
			directions: params[:directions],
			prep_time: params[:prep_time],
			image_url: params[:image_url]
		}
		recipe = Unirest.post("http://localhost:3000/api/recipes", parameters: client_params).body
		flash[:success] = "Recipe successfully created!"
		redirect_to "/client/recipes/#{recipe['id']}"
	end

	def edit
		recipe = Unirest.get("http://localhost:3000/api/recipes/#{params[:id]}")
		@recipe = recipe.body
		render 'edit.html.erb'
	end

	def update
		client_params = {
			title: params[:title],
			chef: params[:chef],
			ingredients: params[:ingredients],
			directions: params[:directions],
			prep_time: params[:prep_time],
			image_url: params[:image_url]
		}
		recipe = Unirest.patch("http://localhost:3000/api/recipes/#{params[:id]}", parameters: client_params).body
		flash[:success] = "Recipe successfully updated!"
		redirect_to "/client/recipes/#{recipe['id']}"
	end

	def destroy
		recipe_id = params[:id]
		recipe = Unirest.delete("http://localhost:3000/api/recipes/#{recipe_id}").body
		flash[:danger] = "Recipe successfully obliterated!"
		redirect_to "/client/recipes"
	end
end






