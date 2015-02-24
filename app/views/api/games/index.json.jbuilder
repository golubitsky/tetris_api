json.array!(@games) do |game|
  json.partial!('api/games/game_index_item', game: game)
end
