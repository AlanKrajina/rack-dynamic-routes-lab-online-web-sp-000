class Application

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
      items_name = req.path.split("/items/").last 
      item = Item.all.find{|s| s.name == items_name} #object iz ITEM clase
 
    if req.path.match(/items/) 
      
      if Item.all.include? item
    
      resp.write item.price
    
      else
      resp.write "Item not found"
      resp.status = 400
    end
    
     else
      resp.write "Route not found"
      resp.status = 404
    
  end
    resp.finish
  end
end