json.video do 
    json.set! @video.id do 
        json.partial! 'api/videos/video', video: @video
    end
end