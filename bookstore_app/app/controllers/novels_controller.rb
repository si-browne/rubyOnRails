class NovelsController < ApplicationController

    before_action :authorize, :only => [ :create]

    def index
        @novels=Novel.all
        @genre=Genre.all
    end

    def show
        @novel=Novel.find(params[:id])
        @genre=Genre.find(params[:id])
    end

    def new
        @novel=Novel.new
        @genre=Genre.new
        @author=Author.new
        @publisher=Publisher.new
    end

    def create
        @novel = Novel.new(novel_params)
        if @novel.save
        redirect_to novels_path, notice:
        "You have successfully created a novel"
        else
        redirect_to novels_path, alert:
        "You will need to be signed in to create a novel"
        end
    end

    def update
        @novel = Novel.find(params[:id])
        if @novel.update(novel_params)
        redirect_to @novel
        else
        render 'edit'
        end
    end

    def edit
        @novel = Novel.find(params[:id])
    end

    def destroy
        @novel = Novel.find(params[:id])
        @novel.destroy
        redirect_to novels_path
    end

    def search
        @novels = if params[:term]
            #input parameter term = user input
            #potential site of SQL injection
            #Novel.where('title = ?', "%#{params[:term]}")

        Novel.where(["title = ?", "#{params[:term]}"])
        else
        Novel.all
        end
    end

    private 
    def novel_params
        params.require(:novel).permit(:title, :genre_id, :author_id, :publisher_id, :isbn, :price, :publication, :format, :description, :pages)
    end
    
end
