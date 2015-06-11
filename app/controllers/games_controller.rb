class GamesController < ApplicationController

	before_action :get_id, :only =>[:show, :destroy, :update]

	def index
		@games=Game.all
	end

	def show
		
	end

	def create

		@game=Game.new(get_form)
		@game.save
		redirect_to games_path
		
		
	end

	def new

		@game=Game.new

	end

	def update



	end

	def destroy

		Game.destroy(@game)
		redirect_to games_path


	end 

	def edit

	end

	private

	def get_id

		@game= Game.find(params[:id])

	end

	def get_form
		params.require(:game).permit(:name, :description, :year)

	end
end
