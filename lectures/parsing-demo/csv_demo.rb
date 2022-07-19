require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/beatles.csv"

# PARSING CSV

# CSV.foreach(filepath, headers: :first_row, header_converters: :symbol) do |row|
#   # p row => Hash
#     f_name = row[:first_name] => As a string row["First Name"]
#     l_name = row[:last_name]
#     instrument = row[:instrument]

#     puts "#{f_name} #{l_name} played #{instrument}"
# end

# STORING CSV

filepath = "data/new_beatles.csv"

musicians = [
  {firstname: "Christina", lastname: "Aguilera", instrument: "Voice"},
  {firstname: "Bruce", lastname: "Dickinson", instrument: "High Voice"},
  {firstname: "Carlos", lastname: "Santana", instrument: "Guitar"}
]

CSV.open(filepath, "wb", force_quotes: true) do |csv|
  csv << ["First Name", "Last Name", "Instrument"]

  musicians.each do |musician|
    # musician is a Hash

    csv << [musician[:firstname], musician[:lastname], musician[:instrument]]
  end
end
