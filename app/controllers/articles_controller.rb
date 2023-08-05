class ArticlesController < ApplicationController


    def show
        set_article
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        set_article
    end

    def update
        set_article
        if @article.update(articles_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        set_article
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def articles_params
        params.require(:article).permit(:title, :description)
    end

end