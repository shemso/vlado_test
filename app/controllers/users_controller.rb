class UsersController < ApplicationController

  def index
  	@users = User.all.page(2)
  	respond_to do |format|
  		format.html
  		format.json { render json: @users }
  	end
  end

  def show
  end

end
