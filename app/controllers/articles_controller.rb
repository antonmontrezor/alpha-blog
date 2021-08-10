class ArticlesController < ApplicationController
  def show
    # article is an instance variable
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end

  def new

  end

  def create
    render plain: params[:article]
  end
end