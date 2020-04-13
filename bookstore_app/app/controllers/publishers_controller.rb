class PublishersController < ApplicationController

    def index
        @publishers=Publisher.all
    end

    def show
        @publisher=Publisher.find(params[:id])
    end

    def new
        @publisher=Publisher.new
        @novel=Novel.new
    end

    def create
        @publisher = Publisher.new(publisher_params)

        #redirecting to publisher url when successfully created
        if @publisher.save
            redirect_to publishers_path
        else
            render 'new'
        end

    end

    def update
    end

    def edit
    end

    def destroy
    end

    private 
    def publisher_params
        params.require(:publisher).permit(:name, :country)
    end

    
end
