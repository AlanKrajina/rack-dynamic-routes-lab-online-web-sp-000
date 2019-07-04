class Application

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      items_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == items_title}
 
      resp.write song.artist
    end
 
    resp.finish
  end
end