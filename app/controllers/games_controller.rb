class GamesController < ApplicationController

	before_action :get_id, :only =>[:show, :destroy, :update, :edit]

	def index
		@games=Game.page(params[:page]).per(5)
		@newgame=Game.new
		#@editgame=Game.find(params[:id])


	end

	def show
		
	end

	def create

		@game=Game.new(get_form)
		@game.save
		flash[:notice] = "新增成功"
		redirect_to games_path
		
		
	end

	def new

		@game=Game.new

	end

	def update

		@game.update(get_form)
		redirect_to games_path
		flash[:notice] = "更新成功"

	end

	def destroy

		Game.destroy(@game)
		redirect_to games_path
		flash[:notice] = "刪除成功"

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
