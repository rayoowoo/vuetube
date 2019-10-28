json.extract! genre, :id, :name, :description

json.videos do
    genre.videos.each do |video|
        json.set! video.id do
            json.partial! 'api/videos/video', video: video
        end
    end
end