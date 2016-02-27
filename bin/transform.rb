#!/usr/bin/env ruby

require_relative "../boot"

files = Dir.entries("./data/fnames")
files.peach(16) do |file|
  next unless file =~ /yob\d{4}/

  year = /(\d{4})/.match(file).captures[0].to_i

  buffer = []
  CSV.foreach(File.join(Dir.pwd, "data", "fnames", file)) do |row|
    buffer << row

    if buffer.length > 99
      GivenName.load_from_csv(year, buffer)
      buffer = []
    end
  end

  # Insert any we missed
  GivenName.load_from_csv(year, buffer)
end

files = Dir.entries("./data/lnames")
files.peach(16) do |file|
  next unless file =~ /yob\d{4}/

  year = /(\d{4})/.match(file).captures[0].to_i

  buffer = []
  CSV.foreach(File.join(Dir.pwd, "data", "lnames", file), headers: :first_row) do |row|
    buffer << {
      name: row["name"].downcase,
      rank: row["rank"],
      count: row["count"],
      pctwhite: row["pctwhite"],
      pctblack: row["pctblack"],
      pctapi: row["pctwhite"],
      pctaian: row["pctaian"],
      pct2prace: row["pct2prace"],
      pcthispanic: row["pcthispanic"],
      year: year,
      country_code: "us",
    }

    if buffer.length > 99
      Surname.create!(buffer)
      buffer = []
    end
  end

  # Insert any we missed
  Surname.create!(buffer)
end

