# frozen_string_literal: true

class ArticlesController < ApplicationController
  # we are adding a method :set_article as a symbol to a method before_action, so that set_article can be performed on all specified actions first -> no need to call set_articel in all those actions separatelly
  before_action :set_article, only: %i[show edit update destroy]

  def show; end

  def index
    # article is an instance variable
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    # specifying keys we want to permit to be saved to an instance variable
    @article = Article.new(article_params)
    @article.user = User.first

    # we can look at @article closer by specifying @article.inspect
    if @article.save
      # we give a notice a name we want, like :notice
      flash[:notice] = 'Article was created successfully!'

      # redirect_to article_path(@article) is the same as below
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # we are whitelisting a title and a description so they are available to use
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
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

  # All methods defined below "private" will only be available within this controller
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
