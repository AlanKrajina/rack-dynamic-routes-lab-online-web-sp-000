class Application

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
      items_name = req.path.split("/items/").last 
      item = Item.all.find{|s| s.name == items_name} 
 
    if req.path.match(/items/)
    
      resp.write item.price
    elsif Item.all.include? item
    
      resp.status = 400
     else
      resp.write "Route not found"
      resp.status = 404
    
  end
    resp.finish
  end
end