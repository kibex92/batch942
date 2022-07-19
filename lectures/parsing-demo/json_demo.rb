require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# PARSING JSON
serialized_beatles = File.open(filepath).read
beatles_hash = JSON.parse(serialized_beatles)
p beatles_hash["beatles"][1]["last_name"]
   # Hash      # Array    # Hash

# STORING JSON

musician = {
  first_name: "Christina", last_name: "Aguilera", instrument: "Voice"
}


beatles_hash["beatles"] << musician


File.open(filepath, "wb") do |file|
  file.write(JSON.pretty_generate(beatles_hash))
end
