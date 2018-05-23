class ArticlesController < ApplicationController
    #GET /articles
    def index
        @articles = Article.all 
    end
    #GET /articles/:id
    def show
        @article = Article.find(params[:id])
        Article.where("id = ?", params[:id])
    end
    #GET /articles/new
    def new
        @article = Article.new
    end
    #POST /articles
    def create
        @article = Article.new(article_params)
        if @article.validate
            @article.save
            redirect_to @article
        else
            render :new
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to @articles_path
    end
    def update
        
    end

    private
    def article_params
        params.require(:article).permit(:title,:body)
    end

    #Le decimos que los campos en los cuales el usuario puede actuar es el title y el body, básicamente para evitar posibles ataques.

end