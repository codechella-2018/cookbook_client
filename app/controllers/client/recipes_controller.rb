class Client::RecipesController < ApplicationController

	def index
		response = Unirest.get("http://localhost:3000/api/recipes/")
		@recipes = response.body #all recipes in an array
		render "index.html.erb"
	end

	def show
		response = Unirest.get("http://localhost:3000/api/recipes/#{params[:id]}")
		@recipe = response.body
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
		response = Unirest.post("http://localhost:3000/api/recipes", parameters: client_params).body
		render 'create.html.erb'
	end

	def edit
		response = Unirest.get("http://localhost:3000/api/recipes/#{params[:id]}")
		@recipe = response.body
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
		response = Unirest.patch("http://localhost:3000/api/recipes/#{params[:id]}", parameters: client_params).body
		render 'update.html.erb'
	end

	def destroy
		recipe_id = params[:id]
		response = Unirest.delete("http://localhost:3000/api/recipes/#{recipe_id}").body
		render 'destroy.html.erb'
	end
end






