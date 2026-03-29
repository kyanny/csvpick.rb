#!/usr/bin/env ruby

require "csv"
require "optparse"

col = nil
OptionParser.new do |o|
  o.on("-c", "--column COLUMN") { |v| col = v.match?(/\A-?\d+\z/) ? v.to_i : v }
end.parse!
abort "Error: -c / --column option is required" unless col

# NOTE: headers: true causes the first row to be consumed as headers and excluded from output.
# If the input CSV has no header row, the first data row will be silently lost.
# Workaround: prepend a dummy header with `csvformat -H input.csv | ruby csvpick.rb -c a`
input = $stdin.read.encode("UTF-8").sub(/\A\xEF\xBB\xBF/, "")
CSV.parse(input, headers: true, liberal_parsing: true) { |row| puts row[col] }