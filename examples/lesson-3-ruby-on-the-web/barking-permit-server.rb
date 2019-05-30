require("webrick")
require("date")

def convert_to_dog_years(age_human_years)
  return age_human_years * 7
end

server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: './public')

server.mount_proc("/home") do |request, response|
  dog_name = request.query["dog-name"]
  dog_age = request.query["dog-age"]

  if dog_name
    response.body = File.read("barking-permit-template.html").
      sub("DOG_NAME", dog_name).
      sub("DOG_AGE_HUMAN_YEARS", dog_age).
      sub("DOG_AGE_DOG_YEARS", convert_to_dog_years(dog_age.to_i).to_s).
      sub("PERMIT_ISSUED_ON", Date.today().strftime("%d/%m/%Y")).
      sub("PERMIT_VALID_UNTIL", (Date.today() + 1000).strftime("%d/%m/%Y"))
  else
    response.body = File.read("index.html")
  end
end

server.start()
