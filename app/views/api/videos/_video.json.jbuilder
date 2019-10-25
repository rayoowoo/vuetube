json.extract! video, :id, :title, :url, :description

json.uploader do
    json.partial! 'api/users/user', user: video.uploader
end