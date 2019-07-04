class Application

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      items_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      item = Item.find{|s| s.title == items_title}
 
      resp.write item.price
    
     else
      resp.write "Route not found"
      resp.status = 404
    
  end
    resp.finish
  end
end