# Dreamcatcher to scrap housing classfields
# 0.1
# $ ruby home_scraper.rb for now
# Reference :
# https://codeburst.io/bottom-of-the-barrel-8ef73eff00f0
# http://ruby.bastardsbook.com/chapters/html-parsing/
# https://medium.freecodecamp.org/how-to-scrape-with-ruby-and-nokogiri-and-map-the-data-bd9febb5e18a

# Look into Selenim, headless browsing instead of html/xml scrapping
# https://readysteadycode.com/howto-scrape-websites-with-ruby-and-headless-chrome

# Capistrano for task automation that supports VPNs
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
    id = place.attr('data-listid').strip.to_i
    title = place.css('div h4').text.strip.downcase
    url = place.css('div h4 a').attr('href').value
    price = place.css('div div.propery_price4_grid').text.to_i * 1000
    size = place.css('div div.infosize_unit_type4 span').text.to_i
    rooms_count = place.css('div div.inforoom_unit_type4 span').text.to_i
    bedrooms = place.css('div div.infobath_unit_type4 span').text.to_i

    # mind propierty _unit_type4 which could be subject to change
    offer_type = place.css('div div.ribbon-inside').text
    area =  place.css('div div.property_address_type4 span:first-child').text.gsub(/[\s,]/ ,"") 
    agent = place.css('div div.property_agent_wrapper').text.split(/ |\_/).map(&:capitalize).join(" ").strip # cannot remove two spaces ?
    # loop trough carousel to get images
    images = []
    page.css('div.carousel').collect do |img|
      images.push(
        img.css('div.item img').attr('src').value
      )
    end

    # push into an array
     propierties.push(
    id: id,
    title: title,
    url: url,
    price: price,
    size: size,
    images: images,
    roomsCount: rooms_count,
    bedrooms: bedrooms,
    offerType: offer_type,
    districtArea: area,
    agency: agent
  )
    # TODO iteration 2 
    # get inside each offer to retrieve VIEWCONT and tag them as hot if 0
    # and energy class, is elevator available, regex avenue/rue/boulevard/impasse to get an area on map 
    
    # MAYBE iteration 2
    # scrap five last pages instead of one to get 30 * 5 results on each pass

  end

  # 30 items by page
  puts "Scrapped #{propierties.length} propierties"

# generate a json file from  array and save it.
json = JSON.pretty_generate(propierties)
File.open("mm_immo_data.json", 'w') { |file| file.write(json) }