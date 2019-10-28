json.extract! playlist, :id, :name

json.videos do
    playlist.videos.each do |video|
        json.set! video.id do
            json.partial! 'api/videos/video', video: video
        end
    end
end