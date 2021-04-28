class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_articles)
    if @article.save
      flash[:notify] = "Article was created succesfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @article.update(params_articles)
    if @article.save
      flash[:notify] = "Article was updated succesfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def params_articles
    params.require(:article).permit(:title, :description, :status)
  end
end