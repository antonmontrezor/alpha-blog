class ArticlesController < ApplicationController
  def show
    # article is an instance variable
    @article = Article.find(params[:id])
  end
end