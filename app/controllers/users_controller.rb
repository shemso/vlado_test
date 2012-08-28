class UsersController < ApplicationController

  def index
  	# @users = User.all
  	@users = 	Kaminari.paginate_array(User.latest).page(params[:page])
  	respond_to do |format|
  		format.html
  		format.json { render json: @users }
  	end
  end

  def show
  end

end
