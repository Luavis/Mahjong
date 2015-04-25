
Log.all.each do | l |
  l.created_at= l.ranking.created_at unless l.ranking.nil? or l.ranking.created_at.nil?
  l.save
end