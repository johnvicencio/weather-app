require 'rubygems'
require 'weather-api'
require 'nokogiri'
require 'open-uri'
require 'date'

print "Enter your zip code: "
zipcode = gets.chomp

# Using http://woeid.rosselliot.co.nz to look up for woeid as required by Yahoo Weather
doc = Nokogiri::HTML(open("http://woeid.rosselliot.co.nz/lookup/#{zipcode}"))

# Get the WEOID based on this css
weoid = doc.css('.woeid').children[1]
city = doc.css('.woeid_row').children[0].inner_html

# instantiate a lookup based on WEOID with Fahrenheit 
response = Weather.lookup(weoid, Weather::Units::FAHRENHEIT)

# get weather variables
temperature = response.condition.temp
condition = response.condition.text
forecasts = response.forecasts
title = response.title
time = DateTime.parse(title).strftime("%I:%M %p")


# display weather in the city
puts "It's #{temperature} degrees and #{condition} in #{city} at #{time}."
puts "Forcast: "

# then get forecast
for f in 0..4
    case f
        when 0 
            puts "Today - #{forecasts[f].text}.  High: #{forecasts[f].high} Low: #{forecasts[f].low}"
        when 1
            puts "Tomorrow - #{forecasts[f].text}.  High: #{forecasts[f].high} Low: #{forecasts[f].low}"
        else 
            puts "#{forecasts[f].day} - #{forecasts[f].text}.  High: #{forecasts[f].high} Low: #{forecasts[f].low}"
    end
    
end
