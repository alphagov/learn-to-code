require("webrick")
server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: './public')

server.mount_proc("/home") do |request, response|
  response.body = File.read("index.html")
end

server.start()
