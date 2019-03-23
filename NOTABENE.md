# one classfield

rails g scaffold Classfield offer_id:string url:string price:float size:float rooms_count:integer bedrooms:integer offer_type:string district_area:string full_description:text energy_ratio construction_date:datetime offer_view_count:integer agency:string origin:string

# one classfield has many images 1:n relationship

rails g scaffold ClassfieldImage classfield:reference

# generate uml pdf

bundle exec erd --title='Dreamcatcher' --filetype=png --filename='uml'

<!-- "id": 24876,
    "title": "appartement – 2 pièces – paris 1...",
    "url": "https://www.morissimmobilier.com/achat-appartement/appartement-a-vendre-2-pieces-36m2-paris-75010-moriss-immobilier/",
    "price": 365000,
    "size": 36,
    "images": [],
    "roomsCount": 2,
    "bedrooms": 1,
    "offerType": "Disponible",
    "districtArea": "Paris",
    "fullDescription": "faubourg du saint denis / chabrol:",
    "energyRatio": "A",
    "constructionDate": "1900-01-01 00:00:00 +0100",
    "offerViewCount": 71,
    "agency": "Moriss Belleville  " -->
