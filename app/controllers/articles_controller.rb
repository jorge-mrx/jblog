class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "jorge", password: "123", except: [:index, :show]

    def index
        @articles = Article.all
    end
    
    def show
      puts "SHOWING!!!!!!///////////"
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
      puts "EDITING!!!!!!///////////"
        @article = Article.find(params[:id])
      end
    
    def create
        @article = Article.new(article_params)
        puts "CREATIIIING!!!!!!///////////"
        if @article.save
          redirect_to @article
        else
          render 'new'
        end
      end

      def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
      end

      def destroy
        puts "DESTROYING!!!!!!!///////////"
        @article = Article.find(params[:id])
        @article.destroy
     
        redirect_to articles_path
      end
       
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
