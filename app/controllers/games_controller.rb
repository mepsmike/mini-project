class GamesController < ApplicationController

	before_action :get_id, :only =>[:show, :destory, :update]

	def index
		@games=Game.all
	end

	def show
		
	end

	def create
		
	end

	def new

	end

	def update

	end

	def destroy

	end 

	def edit

	end

	private

	def get_id

		@game= Game.find(params[:id])

	end
end
