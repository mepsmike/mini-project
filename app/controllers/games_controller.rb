class GamesController < ApplicationController

	before_action :get_id, :only =>[:show, :destroy, :update]

	def index
		@games=Game.page(params[:page]).per(5)
		
		@newgame=Game.new


	end

	def show
		
	end

	def create

		@game=Game.new(get_form)
		if @game.save
			flash[:notice] = "新增成功"
			redirect_to games_path
		else
			redirect_to games_path
		
		end
		
		
		
	end

	def new

		@game=Game.new

	end

	def update

		if@game.update(get_form)
			redirect_to games_path
			flash[:notice] = "更新成功"
		else
			redirect_to games_path
		end
	end

	def destroy

		Game.destroy(@game)
		redirect_to games_path
		flash[:notice] = "刪除成功"

	end 

	def edit

		@game = Game.find(params[:id])
		@games=Game.page(params[:page]).per(5)
		render :action => :index


	end

	private

	def get_id

		@game= Game.find(params[:id])

	end

	def get_form
		params.require(:game).permit(:name, :description, :year)

	end
end
