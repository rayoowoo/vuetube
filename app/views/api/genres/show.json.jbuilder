json.genre do 
    json.set! @genre.id do 
        json.partial! 'api/genres/genre', genre: @genre
    end
end