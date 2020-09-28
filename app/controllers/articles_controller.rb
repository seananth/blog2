class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
    @articles = Article.all.order(created_at: :desc)
    end

    def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
    end

    def new
    @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save
        flash.notice = "Successfully posted '#{@article.title}'"

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id]).destroy
        flash.notice = "Article deleted"

        redirect_to action: 'index'
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end

end

##I3: Tagging
