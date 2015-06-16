class GamesController < ApplicationController

	before_action :set_game, :only =>[:show, :destroy, :update]

	def index
		prepare_variable_for_index
		if params[:gid]
			@game= Game.find(params[:gid])
		else
			@game=Game.new
		end
	end

	def show
		
	end

	def create
		@game=Game.new(get_form)

		if @game.save
			flash[:notice] = "新增成功"
			redirect_to games_path
		else
			prepare_variable_for_index#因為要顯示首頁，所以render前要先抓不然會錯誤
			render :action => :index
		end
	end

	#def new
	#	@game=Game.new
	#end

	def update

		if @game.update(get_form)
			redirect_to games_path
			flash[:notice] = "更新成功"
		else
			prepare_variable_for_index#因為要顯示首頁，所以render前要先抓不然會錯誤
			render :action => :index
		end
	end

	def destroy
		Game.destroy(@game)

		redirect_to games_path
		flash[:notice] = "刪除成功"

	end 

	#def edit		
	#	@games=Game.page(params[:page]).per(5)
	#	render :action => :index
	#end

	private

	def set_game
		@game= Game.find(params[:id])
	end

	def get_form
		params.require(:game).permit(:name, :description, :year)
	end

	def prepare_variable_for_index
		@games = Game.page(params[:page]).per(5)
	end

end
