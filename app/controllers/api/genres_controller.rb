class Api::GenresController < ApplicationController
    def index
        @genres = Genre.includes(:videos).all
        render :index
    end

    def show
        @genre = Genre.includes(:videos).find(params[:id])
        render :show
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            render :show
        else
            render json: @genre.errors.full_messages, status: 422
        end
    end

    def update
        @genre = Genre.includes(:videos).find(params[:id])
        if @genre.update_attributes(genre_params)
            render :show
        else
            render json: @genre.errors.full_messages, status: 422
        end
    end

    def destroy
        @genre = Genre.includes(:videos).find(params[:id])
        if @genre 
            @genre.destroy
            render :show
        else
            render json: ['Genre was not found'], status: 404
        end
    end

    private

    def genre_params
        params.require(:genre).permit(:name, :description)
    end
end