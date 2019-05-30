require("webrick")
server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: './public')

server.mount_proc("/home") do |request, response|
  dog_name = request.query["dog-name"]
  dog_age = request.query["dog-age"]

  if dog_name
    response.body = File.read("barking-permit-template.html").
      sub("DOG_NAME", dog_name).
      sub("DOG_AGE_HUMAN_YEARS", dog_age)
  else
    response.body = File.read("index.html")
  end
end

server.start()
