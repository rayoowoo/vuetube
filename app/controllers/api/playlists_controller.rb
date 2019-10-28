class Api::PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.includes(:videos).all
        render :index
    end

    def show
        @playlist = Playlist.find(params[:id]).includes(:videos)
        render :show
    end

    def create
        @playlist = Playlist.new(playlist_params)
        if @playlist.save
            render :show
        else
            render json: @playlist.errors.full_messages, status: 422
        end
    end

    def update
        @playlist = Playlist.find(params[:id]).includes(:videos)
        if @playlist.update_attributes(playlist_params)
            render :show
        else
            render json: @playlist.errors.full_messages, status: 422
        end
    end

    def destroy
        @playlist = Playlist.find(params[:id]).includes(:videos)
        if @playlist 
            @playlist.destroy
            render :show
        else
            render json: ['Playlist was not found'], status: 404
        end
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name, :user_id)
    end
end