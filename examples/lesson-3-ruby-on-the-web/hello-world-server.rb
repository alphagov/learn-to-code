require("webrick")
server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: './public')

server.mount_proc("/") do |request, response|
  puts("Hello server!")
  response.body = "Hello browser!"
end

server.start
