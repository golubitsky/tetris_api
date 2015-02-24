json.(game,
  :id,
  :username,
  :score,
  :lines,
  :start_level,
  :end_level,
  :time,
  )

json.date game.created_at.strftime("%Y %B %d")
json.time game.created_at.strftime("%H:%M")
