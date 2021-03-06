class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end

  def create
    #debugger
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Matthew Blog #{@user.username}"
        redirect_to articles_path
      else
        render 'new'   #if not pass validation
      end
  end

  def show
    #@user = User.find(params[:id])
    #for pagination
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'   #if not pass validation
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
