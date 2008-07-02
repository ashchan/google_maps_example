# This script is designed to be run directly from the command line.
# It will asssemble the FCC communication structure data (EN.dat, RA.dat, CO.dat)
# into a single file, towers.dat.
#
# It expects the three input files (EN.dat, RA.dat, CO.dat) to be in the
# same directory as this script. The output (towers.dat) will also be in the
# same directory.

puts "starting . . ."
# open first two files and read them into a large hash of lines
# First is owners, or EN.dat
owners = Hash.new
IO.foreach('EN.dat') do |line|
  fields=line.split('|')
  id = fields[4]
  owners[id]=fields
end

puts "#{owners.size} owners"

# next is structures in RA.dat
structures = Hash.new
IO.foreach('RA.dat') do |line|
  fields=line.split('|')
  id = fields[4]
  structures[id]=fields
end

puts "#{structures.size} structures"

# open the output file
out = File.new('towers.dat', 'w')

# open the locations file, iterate through and correlate with hashes from other two files
IO.foreach('CO.dat') do |line|
  l_fields=line.split('|')
  id = l_fields[4]
  o_fields=owners[id]
  s_fields=structures[id]
  
  
  lat_deg, lat_min, lat_sec, lat_dir, long_deg, long_min, long_sec, long_dir = l_fields.values_at(6,7,8,9,11,12,13,14)
  sign = (lat_dir == 'S') ? -1 : 1
  latitude = sign * (lat_deg.to_f + lat_min.to_f / 60 + lat_sec.to_f/3600)
  sign = (long_dir == 'W') ? -1 : 1
  longitude = sign * (long_deg.to_f + long_min.to_f / 60 + long_sec.to_f/3600)

  # print the combined fields to the output file 
  # fields are: latitude,longitude, owner name, owner street address, owner city, owner state, owner zip, 
  # address, city, state, height, elevation, ohag, ohamsl, structure_type
  out.puts [id,latitude,longitude,o_fields.values_at(7,14,16,17,18),s_fields.values_at(23,24,25,26,27,28,29,30)].flatten.join('|')

end

out.close
puts "Done"