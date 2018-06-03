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
end
