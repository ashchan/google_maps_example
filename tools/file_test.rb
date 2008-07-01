input_file = 'RA.dat'
output_file = 'output.dat'

out = File.new(output_file, 'w')
count = 0
IO.foreach(input_file) do |line|
  columns = line.split("|")
  out.puts columns.values_at(1, 2, 3).join("|")
  count += 1
  break if count >= 10
end

out.close
puts "done, see #{output_file}"