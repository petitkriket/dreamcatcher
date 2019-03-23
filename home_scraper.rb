# Dreamcatcher to scrap housing classfields
# v 0.1
# Documentation :
# https://codeburst.io/bottom-of-the-barrel-8ef73eff00f0
# http://ruby.bastardsbook.com/chapters/html-parsing/
# https://medium.freecodecamp.org/how-to-scrape-with-ruby-and-nokogiri-and-map-the-data-bd9febb5e18a

# Selenim is headless so it could scroll to bypass simple HTML/XML limitations
# https://readysteadycode.com/howto-scrape-websites-with-ruby-and-headless-chrome

# Capistrano for task automation that support VPNs
# https://github.com/capistrano/capistrano/

require 'nokogiri'
require 'open-uri'
require 'json'

# load page to scrap out with large criterias to scap as munch as possible, VPN could be an option here
page = Nokogiri::HTML(open("https://www.morissimmobilier.com/recherche-immobiliere-avancee/?advanced_city=&surface-min=0&nb-chambres-min=0&budget-max=5000000"))

propierties = []

# selects DOM elements and collects data
# unique identifier, title, link, price, size in sqm, # rooms, # beddings, offer type, agent and pictures.
page.css('div#listing_ajax_container .col-md-6').collect do |place|
    puts place.attr('data-listid').strip
    puts place.css('div h4').text.strip
    puts place.css('div h4 a').attr('href')
    puts place.css('div div.propery_price4_grid').text.to_i * 1000
    puts place.css('div div.infosize_unit_type4 span').text.to_i
    puts place.css('div div.inforoom_unit_type4 span').text.to_i
    puts place.css('div div.infobath_unit_type4 span').text

    # mind propierty _unit_type4 for later 
    puts place.css('div div.ribbon-inside').text
    puts place.css('div div.property_address_type4 span:first-child').text.gsub(/[\s,]/ ,"") 
    puts place.css('div div.property_agent_wrapper').text.strip.split(/ |\_/).map(&:capitalize).join(" ")
    
    # loop trough carousel to get images
    page.css('div.carousel').collect do |img|
      puts img.css('div.item img').attr('src')
    end

    # TODO iteration 2 get inside each offer to retrieve VIEWCONT and tag them as hot if 0
    # and energy class, is elevator available, regex avenue/rue/boulevard/impasse to get an area on map 
    
    # TODO iteration 2 scrap five last pages

  end

# generate a json file from the array and save it for now
#json = JSON.pretty_generate(propierties)
#File.open("mm_immo_data.json", 'w') { |file| file.write(json) }