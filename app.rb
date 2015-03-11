require("sinatra")
require("sinatra/reloader")
require("lib/**/*.rb")
require("pg")

get("/") do
  erb(:index)
end


