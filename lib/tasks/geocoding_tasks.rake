require 'open-uri'
require 'rexml/document'

api_key = "ABQIAAAApuqJ-ievoI8n0KBpKtZuyxTJQa0g3IQ9GZqIMmInSLzwtGDKaBSt40PUewe_UUsm_5pWXNbz5adklA"

task :google_geocode => :environment do
  
  Store.all.each do |store|
    puts "\nStore: #{store.name}"
    puts "Source Address: #{store.full_address}"
    
    xml = open("http://maps.google.com/maps/geo?q=#{CGI.escape(store.full_address)}&output=xml&key=#{api_key}").read
    doc = REXML::Document.new(xml)
    
    puts "Status: " + doc.elements['//kml/Response/Status/code'].text
    
    if doc.elements['//kml/Response/Status/code'].text != '200'
      puts "Unable to parse Google response for #{store.name}"
    else
      doc.root.each_element('//Response') do |response|
        response.each_element("//Placemark") do |place|
          lng, lat = place.elements['//coordinates'].text.split(',')
          
          puts "Result Address: " << place.elements['//address'].text
          puts " Latitude: #{lat}"
          puts " Longitude: #{lng}"
        end
      end
    end
  end
  
end

task :google_persist => :environment do
  Store.all.each do |store|
    puts "\nStore: #{store.name}"
    puts "Source Address: #{store.full_address}"
    
    xml = open("http://maps.google.com/maps/geo?q=#{CGI.escape(store.full_address)}&output=xml&key=#{api_key}").read
    doc = REXML::Document.new(xml)
    
    puts "Status: " + doc.elements['//kml/Response/Status/code'].text
    
    if doc.elements['//kml/Response/Status/code'].text != '200'
      puts "Unable to parse Google response for #{store.name}"
    else
      lng, lat = doc.root.elements['//coordinates'].text.split(',')
      
      store.lat = lat
      store.lng = lng
      store.save
    end
  end
end