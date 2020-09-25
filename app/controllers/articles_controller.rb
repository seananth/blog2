class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
    @articles = Article.all.order(created_at: :desc)
    end

    def show
    @article = Article.find(params[:id])
    end

    def new
    @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id]).destroy

        redirect_to action: 'index'
    end

    def edit
        @article = Article.find(params[:id])
    end

end

#Deletuing articles