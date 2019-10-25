class Api::VideosController < ApplicationController
    def index
        @videos = Video.includes(:uploader).all
        render :index
    end

    def show
        @video = Video.includes(:uploader).find(params[:id])
        render :show
    end

    def create
        @video = Video.new(video_params)
        if @video.save
            render :show
        else
            render json: @video.errors.full_messages, status: 422
        end
    end

    def update
        @video = Video.includes(:uploader).find(params[:id])
        if @video.update_attributes(video_params)
            render :show
        else
            render json: @video.errors.full_messages, status: 422
        end
    end

    def destroy
        @video = Video.find(params[:id])
        if @video 
            @video.destroy
            render :show
        else
            render json: ['Video was not found'], status: 404
        end
    end

    private

    def video_params
        params.require(:video).permit(:title, :description, :user_id, :url)
    end

end