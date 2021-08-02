class ArticlesController < ApplicationController
  def show
    # article is an instance variable
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end
end