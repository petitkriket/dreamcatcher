# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# load json done by nokogiri script triggered with $ruby 
propierties_list = JSON.parse(File.read('lib/assets/mm_immo_data.json'))

propierties_list.each do |prop|

	# do not save if already present inside db.
	check_if_already_saved = Classfield.find_by offer_id: prop["offerId"]

	unless check_if_already_saved

		# create an object for each json item and save as Classfields
		# could be refactored to avoid camelCase to snake_case conversion..
		classfield = Classfield.new(offer_id: prop["offerId"],
		url: prop["url"],
		price: prop["price"],
		size: prop["size"],
		rooms_count: prop["roomsCount"],
		bedrooms: prop["bedrooms"],
		offer_type: prop["offerType"],
		district_area: prop["districtArea"],
		full_description: prop["fullDescription"], 
		energy_ratio: prop["energyRatio"], 
		construction_date: prop["constructionDate"],
		offer_view_count: prop["offerViewCount"],
		agency: prop["agency"])
		# origin: Company.id
		# could be used as a reference key to point EmmitingCompany model, here MM IMMOBILIER) for better scalability
	
		# save the created item into db
		classfield.save!
		puts "Offer #{classfield.offer_id} has been saved into DB 🔥 as Classfield id ##{classfield.id}."
		
		# save images  as associated ressource ClassfieldImage using each  Classfield newly created id
		prop["images"].each do |img, index|
			classfield_img = ClassfieldImage.new(classfield_id: classfield.id, url: img)
			classfield_img.save!
		end
	
		puts "#{prop["images"].length} images has been saved along Classfield #{classfield.offer_id} 📸"
	
	else
		# has been previously scrapped..
		puts "#{prop["offerId"]} is already present inside DB.."	
	end

end