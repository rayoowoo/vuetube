class PlaylistVideoItemsController < ApplicationController
    def create
        @playlist_video_item = PlaylistVideoItem.new(playlist_video_item__params)
        if @playlist_video_item.save
            render :show
        else
            render json: @playlist_video_item.errors.full_messages, status: 422
        end
    end

    def destroy
        @playlist_video_item = PlaylistVideoItem.find(params[:id])
        if @playlist_video_item 
            @playlist_video_item.destroy
            render :show
        else
            render json: ['Playlist Video Item was not found'], status: 404
        end
    end

    private

    def playlist_video_item_params
        params.require(:playlist_video_item).permit(:name, :user_id)
    end
end