class ArticlesController < ApplicationController
  def show
    # article is an instance variable
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit 
    @article = Article.find(params[:id])
  end

  def create
    # specifying keys we want to permit to be saved to an instance variable
    @article = Article.new(params.require(:article).permit(:title, :description))
    # we can look at @article closer by specifying @article.inspect
    if @article.save
      # we give a notice a name we want, like :notice
      flash[:notice] = "Article was created successfully!"
      # redirect_to article_path(@article) is the same as below
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    # we are whitelisting a title and a description so they are available to use
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end 
  end
end