class ArticlesController < ApplicationController
  before_action :set_article, only:[:edit, :update, :show, :destroy]  #only edit, update, show and destroy methods
  def index
    #@articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    #redirect_to articles_show(@article)
    #articles_path is for index action in controller vs article_path is for show action.
    #Plural form is for getting many articles vs singular form is for getting a single article.
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'   #if not pass validation
    end
  end

  def show
    # @article = Article.find(params[:id])
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'   #if not pass validation
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  # http://blog.trackets.com/2013/08/17/strong-parameters-by-example.html
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
