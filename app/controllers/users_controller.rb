class UsersController < ApplicationController

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @users = User.all.paginate(@page)
    @total_pages = User.all.total_pages
    @categories = User.categories

  	respond_to do |format|
  		format.html
      format.js
  		format.json { render json: @users }
  	end
  end

  def category
    @page = params[:page] ? params[:page].to_i : 1
    @users = User.find_by_category(params[:category]).paginate(@page)
    @total_pages = User.find_by_category(params[:category]).total_pages
    @category = params[:category]

    respond_to do |format|
      format.js
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @id = params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

end
