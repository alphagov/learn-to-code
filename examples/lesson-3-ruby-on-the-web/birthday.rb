require("webrick")
server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: './public')

server.mount_proc("/") do |request, response|
  response.content_type = "text/html"
  response.body = %@
    <form action="/birthday">
      <input name="value" type="date">
      <input type=submit>
    </form>
  @
end

server.start

