# Weather App 
Weather App is based on Yahoo Weather by simply entering the zip code. The web app determines your location and the 
API will display perminent weather details like temperature, city based on your zip code, and forecasts.

# Required components

1. weather-api: to get Yahoo Weather objects
2. nokogiri: to scrape WOEID that is required by Yahoo

# Installation

**On Weather-api**

gem install weather-api

**nokogiri**

gem install nokogiri

# Set-Up
require 'rubygems'
require 'weather-api'
require 'nokogiri'
require 'open-uri'
require 'date'




