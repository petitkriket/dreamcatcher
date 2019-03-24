# Dreamcatcher 0.2 
# Scraps housing classfields from MM Immobilier
# run using $ rake classfield:mm_scraper

# load tools
require 'nokogiri'
require 'open-uri'
require 'json'

# task settings
namespace :classfield do
  desc "Scrapping MM baby.."
  task mm_scraper: [:environment] do

# load page to scrap out with large criterias to scap as munch as possible, VPN could be an option here
page = Nokogiri::HTML(open("https://www.morissimmobilier.com/recherche-immobiliere-avancee/?advanced_city=&surface-min=0&nb-chambres-min=0&budget-max=5000000"))

properties = []

# selects DOM elements and collects data
# unique identifier, title, link, price, size in sqm, # rooms, # beddings, offer type, agency and pictures.
page.css('div#listing_ajax_container .col-md-6').collect do |place|
    offer_id = place.attr('data-listid').strip.to_i
    title = place.css('div h4').text.strip.downcase
    url = place.css('div h4 a').attr('href').value
    price = place.css('div div.propery_price4_grid').text.to_i * 1000
    size = place.css('div div.infosize_unit_type4 span').text.to_i
    rooms_count = place.css('div div.inforoom_unit_type4 span').text.to_i
    bedrooms = place.css('div div.infobath_unit_type4 span').text.to_i

    # mind propierty _unit_type4 which could be subject to change
    offer_type = place.css('div div.ribbon-inside').text
    district_area =  place.css('div div.property_address_type4 span:first-child').text.gsub(/[\s,]/ ,"") 
    agency = place.css('div div.property_agent_wrapper').text.split(/ |\_/).map(&:capitalize).join(" ").strip # cannot remove two spaces ?
    # loop trough carousel to get images
    
    # !! contains 30 images, should update 5 FIXME Need refactoring into 3d array !!
    # https://stackoverflow.com/a/14510514/3468846
    images = []
    page.css('div.carousel').collect do |img|
      images.push(
        img.css('div.item img').attr('src').value
      )
    end

    #
      got_additional_data = false
    # go to corresponding view and scrap additionnal data
    unless url.empty?
      offer_html = open(url)
      
      sleep 1 until offer_html
      
      offer = Nokogiri::HTML(offer_html)
      # get pageviews, description, energy score, date of construction
      offer_view_count =  offer.css('div.full_width_prop div.no_views').text.to_i
      full_description = offer.at('div.wpestate_property_description p').text.strip.downcase

      # optional fields, sometimes empty..
      if offer.at('div#collapseOne strong:contains("Classe énergétique:")')
        energy_ratio = offer.at('div#collapseOne strong:contains("Classe énergétique:")').next.text.strip
      else 
      energy_ratio = nil
      end

      if offer.at('div#collapseOne strong:contains("Année Construction:")')
        date_of_construction = offer.at('div#collapseOne strong:contains("Année Construction:")').next.text.to_i
        # convert to db datetime format
        date_of_construction = Time.new(date_of_construction)
      else 
        date_of_construction.to_i = nil
      end

      # go to next offer
      got_additional_data = true
    else
      got_additional_data = true
  end

  sleep 1 until got_additional_data == true

    # push into an array
     properties.push(
    offerId: offer_id,
    title: title,
    url: url,
    price: price,
    size: size,
    images: images,
    roomsCount: rooms_count,
    bedrooms: bedrooms,
    offerType: offer_type,
    districtArea: district_area,
    fullDescription: full_description,
    energyRatio: energy_ratio,
    constructionDate:date_of_construction,
    offerViewCount: offer_view_count,
    agency: agency,
  ) 
  puts "Scrapped offer n°#{offer_id}"
    # TODO iteration 2
    # scrap five last pages instead of one to get 30 * 5 results on each pass

    # TODO iteration 3 
    # is elevator available, regex avenue/rue/boulevard/impasse to get an area lat lng with google Place API 
   
  end

  puts "Scrapped #{properties.length} properties"

# generate a json file from  array and save it.
json = JSON.pretty_generate(properties)
File.open("lib/assets/mm_immo_data.json", 'w') { |file| file.write(json) }
  end
end
