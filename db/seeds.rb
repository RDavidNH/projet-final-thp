# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cities = []
districts = []
users = []
types_obj = []
features_obj = []

types = ['Villa', 'Appartement', 'Bureau', 'Studio', 'Manoir']
status = ['sell', 'rent']
features = ['wc', 'douche', 'garage', 'jardin', 'parking', 'piscine', 'terrasse']

districts_hash = {
    "Analakely" => {
        latitude: -18.908281,
        longitude: 47.52692
    },
    "Itaosy" => {
        latitude: -18.909364,
        longitude: 47.477037
    },
    "Ambohijatovo" => {
        latitude: -18.702808,
        longitude: 47.363262
    },
    "Ankorondrano" => {
        latitude: -18.886758,
        longitude: 47.521299
    },
    "Ivandry" => {
        latitude: -18.87565,
        longitude: 47.525107
    },
    "Ankadikely" => {
        latitude: -18.848572,
        longitude: 47.553342
    },
    "Ankatso" => {
        latitude: -18.915987,
        longitude: 47.565771
    },
    "Ambanidia" => {
        latitude: -18.918807,
        longitude: 47.538123
    },
    "Analamahitsy" => {
        latitude: -18.876794,
        longitude: 47.546878
    },
    "Andraharo" => {
        latitude: -18.884608,
        longitude: 47.509932
    },
    "Alarobia" => {
        latitude: -18.228891,
        longitude: 47.753851
    },
    "Ambodivona" => {
        latitude: -18.683295,
        longitude: 47.576698
    },
    "Antanimena" => {
        latitude: -18.898609,
        longitude: 47.520054
    },
    "Ankadifotsy" => {
        latitude: -18.717549,
        longitude: 47.550704
    },
    "Ankazomanga" => {
        latitude: -18.89162,
        longitude: 47.513574
    },
    "Anosy" => {
        latitude: -18.916398,
        longitude: 47.518638
    },
    "Faravohitra" => {
        latitude: -18.811799,
        longitude: 47.56663
    },
    "Antaninarenina" => {
        latitude: -18.910296,
        longitude: 47.525018
    },
    "Ampasampito" => {
        latitude: -18.896343,
        longitude: 47.546264
    },
    "Anjanahary" => {
        latitude: -18.895872,
        longitude: 47.538433
    },
    "Ankadivato" => {
        latitude: -18.910493,
        longitude: 47.533607
    },
    "Tsimbazaza" => {
        latitude: -18.932596,
        longitude: 47.52749
    },
    "Ambatobe" => {
        latitude: -18.879389,
        longitude: 47.558595
    },
    "Mahamasina" => {
        latitude: -18.919114,
        longitude: 47.524365
    },
    "Ambohibao" => {
        latitude: -18.848989,
        longitude: 47.475185
    },
    "Amboditsiry" => {
        latitude: -18.885443,
        longitude: 47.538765
    },
    "Ambatomainty" => {
        latitude: -18.55296,
        longitude: 47.508332
    },
    "Ambohimanarina" => {
        latitude: -18.360198,
        longitude: 47.135528
    },
    "Ankerana" => {
        latitude: -18.888534,
        longitude: 47.55577
    },
    "Nanisana" => {
        latitude: -18.891785,
        longitude: 47.549472
    }
}



houses = [
    {
        :title => 'Jolie maison à étage F4',
        :description => "Une jolie maison à étage F4 au bord de la route principale à Ankerana
            Hoomies met en location une jolie maison à étage au bord de la route principale
            à Ankerana. Cette jolie villa se trouve à 10 minutes du lycée français et à
            proximité de toutes les commodités. La villa est logée dans un quartier résidentiel
            , calme et sécurisé. Au rez de chaussée on découvre un spacieux living avec
            cheminé donnant sur une terrasse , une cuisine fermée, trois chambres placardées,
            deux salles de bain , une toilette pour visiteur. A l'étage se trouve un comble
            habitable très spacieux avec escalier à l'extérieur qui est un grand avantage
            pour un usage mixte de la maison.A L'extérieur se trouve un jardin , un coin
            cuisine , un abri voiture et un parking pour 5 voitures.",
        :status => 'sell'
    },
    {
        :title => "Une maison F4 meublée",
        :description => "A louer une maison F4 meublée dans une petite résidence
            à Amboditsiry Antananarivo. Cette maison F4 comprend au RDC un garage
            et une petite pièce pouvant servir de bureau et un wc visiteur.
            A l'étage un living avec cuisine ouverte, au 2ème étage 02 chambres
            avec panards, une salle de bain, et une petite terrasse.",
        :status => 'rent'
    },
    {
        :title => "Villa F3",
        :description => "A louer une villa F3 à Ampefiloha Antananarivo
            Hoomies propose en location une villa de type F3 à Ampefiloha
            Elle se situe près de toutes les commodités
            Elle est composée d'un living, 2 chambres dont une avec salle de bain attenante, une salle d'eau
            Garage, parking",
        :status => 'rent'
    },
    {
        :title => "Maison F4",
        :description => "A louer une maison F4,idéale pour ceux qui cherche le
            calme, car elle se trouve à Ambohitrimanjaka Cette villa F4 est une maison
            à étage. Au RDC elle est composée d'un
            living avec cheminée, une cuisine placardée, une buanderie et une toilette
            visiteur. A l'étage, elle possède 3 chambres, une salle de bain avec
            une cabine de douche, et 2 balcons. A l'extérieur, elle a un garage,
            et une dépendance gardien.",
        :status => 'rent'
    },
    {
        :title => "Maison F4 située dans une petite résidence",
        :description => "A louer une maison F4 située dans une petite résidence
             à Ivato Cette villa basse comprend un living, une cuisine, 3 chambres,
             une salle d'eau et une petite terrasse. A l'extérieur, elle a droit à
             un parking pour une voiture. Loyer: 900 000Ar",
        :status =>  'rent'
    },
    {
        :title => "Belle maison à étage de type F5",
        :description => "Hoomies met en vente une maison F5 à Andoharanafotsy
            Cette belle maison à étage de type F5 est à 600m de la route nationale 7,
            elle se trouve dans un quartier calme avec des commodités à proximité :
            Pharmacie, boulangerie, commerce; école et cliniques. la maison comprend
            au RDC : un lumineux séjour en L dotée d'une cheminée et qui donne sur
            une terrasse, une cuisine placardée et une toilette visiteur, à l'étage
            se trouvent : une chambre principale dotée d' un dressing et SDE
            attenante, 3 chambres placardées dont une possède un balcon, une
            salle de bain et une toilette. à l'éxtérieur : une dépendance
            gardien, un garage fermé avec une spacieuse salle de jeux au dessus,
            une grande cour gazonée avec jardin, une autre cour gazonnée à
            l'arrière pour des événements festif ( fête d'anniversaire ou autres).",
        :status => 'sell'
    },
    {
        :title => "Villa F4 avec jardin",
        :description => "Une villa F4 avec jardin à Analamahitsy
            Hoomies propose en location une villa F4 à Analamahitsy
            Elle se trouve dans un quartier calme, de bon voisinage
            Elle est composée d'un grand living, 3 chambres avec placards, une salle de bain, un balcon
            Elle possède un grand jardin, un garage, une dépendance, elle a accès à une piscine.",
        :status => 'rent'
    },
    {
        :title => "Villa F5",
        :description => "A louer une villa F5 qui se trouve à 5 mn de l'université d'Ankatso
            Cette villa F5 est composée de:
            -> RDC: un garage pour 2 voitures
            -> Au 1ère étage: un living avec cheminée; une salle à manger; une cuisine ouverte équipée; une chambre; une salle d'eau et un balcon
            -> Au 2ème étage: 3 chambres dont 2 placardées, une salle de bain et 2 balcons avec une superbe vue sur le palais de la reine
            -> A l'extérieur: un grand parking, une dépendance gardien et un coin barbecue.",
        :status => 'rent'
    },
    {
        :title => "Belle villa F6 avec piscine",
        :description => "Vente d'une belle villa F6 avec piscine à
            Ambohitrarahaba Hoomies vous propose cette grande villa de type F6 à
            Ambohitrarahaba, avec des commodités à proximité : écoles, transport,
            ... Sise dans un quartier résidentiel, la propriété est bien placée et
            très facile d'accès avec un bon voisinage. cette villa dispose Au RDC
            une espace de vie chaleureuse avec mezzanine, munie d'une cheminée, un
            coin télé, salle à manger et salon avec accès à la terrasse,
            une cuisine placardée et une grande pièce, à l'étage vous aurez 4
            chambres placardées dont une suite parentale avec sa salle d'eau
            attenante et balcon et une chambre qui possède une grande terrasse
            avec vue sur piscine, une salle d'eau. A l'extérieur, vous avez Une
            belle piscine, une cour entourée de jardin et arborée, un garage
            fermé pouvant contenir 2 voitures, un petit local pour suprésseur et
            une dépendance gardien.",
        :status => 'sell'
    },
    {
        :title => "Maison de type F5",
        :description => "A louer une maison F5 de niveaux sise à Isoraka
            Antananarivo Hoomies propose en location une maison de type F5 à
            Isoraka pour habitation ou bureau Elle se trouve près de toutes les
            commodités Elle est cpmposée au RDC un garagen un bureau R+1 salon
            avec cheminée, cuisine R+2 2 chambres , une salle d'eau R+3 une
            chambre avec terrasse R+5 comble habitable une cave.",
        :status => 'rent'
    },
    {
        :title => "Villa à étage F4 semi-meublée",
        :description => "A louer une villa à étage F4 semi-meublée dans une
            petite résidence à Varabohitra Itaosy Anrananarivo Hoomies met en
            location une villa F4 semi meublée à Varabohitra Itaosy. La maison
            se trouve dans une petite résidence près des commerces ( banque,
            pharmacie, écoles …) Elle est composée d'un living , un coin
            salle à manger, une cuisine placardée. 3 chambres , une salle de
            bain. Parking pour 2 voitures.",
        :status => 'rent'
    },
    {
        :title => "Modeste villa basse de type F3",
        :description => "A louer une modeste villa basse de type F3 dans une
            petite résidence bien sécurisée sise à Ambohinambo Talatamaty proximité
            de toutes les commodités Hoomies met en location une modeste villa
            basse de type F3 dans une résidence bien sécurisée par une société
            de sécurité sise à Ambohinambo Talatamaty proximité de toutes les
            commodités. Cette maison est composée 2 chambres, un grand séjour,
            une cuisine placardée, une salle d'eau, une buanderie et une
            toilette.Possède une surface habitable de 90 m² et bâtie sur un
            terrain de 600 m² avec un jardin gazonné et des arbres fruités et
            un garage fermé pour une voiture.",
        :status => 'rent'
    },
    {
        :title => "Villa à étage F4",
        :description => "A Vendre une villa F4 à Ambatobe Antananarivo
            Hoomies propose en location une villa à étage F4 à Ambatobe
            Elle se trouve dans un quartier réseidentiel calme avec une belle vue
            Elle est composé d'un living avec cheminée, une cuisine, une salle de bain au RDC.
            a l'étage 3 chambres avec placards, une salle d'eau, une comble aménageable.
            Elle possède un abri voiture, dépendance gardien,parking.",
        :status => 'sell'
    },
    {
        :title => "Grande villa F5",
        :description => "A louer une villa F5 à Ampitatafika Antananarivo
            A louer grande villa F5 Ampitatafika , composée d'un living,
            une cuisine,4 chambres, 1 SDB,1 SDE, un grand comble,un jardin",
        :status => 'rent'
    },
    {
        :title => "Très grande villa F10",
        :description => "Location d'une grande villa F10 très proche CV
            Tsimbazaza Location d'une très grande villa F10 très proche CV
            Tsimbazaza Tananarive. Située dans une propriété de 1600m² en plein
            centre ville, bord de route, la villa est batie sur une surface de
            264m² avec au RDC une surface qui pourrait servir de bureau avec
            5pces + SDE + WC + 1 grande pièce qui pourrait servir de dépôt. A
            l'étage, appartement pour habitation avec 1 grand living d'environ
            80m² donnant sur une terrasse, une cuisine avec placard avec office,
            3 chambres avec placards dont 1 avec SDB attenante - 1 SDB WC Dans la
            partie aile droite de la villa, 1 chambre+SDE + WC + buanderie(2pces)
            A l'extérieur: 1 grand hangar de 160m3. La villa est équipée d'une alarme.",
        :status => 'sell'
    }
]


10.times do
    cities << City.create(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip
    )
end
city_admin = City.create(
        name: 'Antananarivo',
        zip_code: 101
    )

# 20.times do
#     districts << District.create(
#         name: Faker::Address.street_name,
#         description: Faker::Lorem.paragraph(sentence_count: 5),
#         city: cities[rand(0..cities.size)]
#     )
# end

districts_hash.each do |district, coord|
    districts << District.create(
        name: district,
        latitude: coord[:latitude],
        longitude: coord[:longitude],
        description: Faker::Lorem.paragraph(sentence_count: 5),
        city: cities[rand(0..cities.size)]
    )
end

users << User.create(
        email: 'hoomiesadmin@yopmail.com',
        password: 'hoomiesadmin',
        firstname: 'Admin',
        lastname: 'Hoomies',
        role: 'admin',
        phone: '+261 34 11 111 11',
        address: 'Ivandry, Bâtiment Bloc 3, 5ème étage',
        city: city_admin,
        offer_type: ''
    )

users << User.create(
        email: 'hsowner@yopmail.com',
        password: 'adminadmin',
        firstname: 'Owner',
        lastname: 'Hoomies',
        role: 'owner',
        phone: '+261 34 11 111 11',
        address: 'Ivandry, Bâtiment Bloc 3, 5ème étage',
        city: cities.sample
    )


3.times do |i|
    users << User.create(
        email: "hsadmin#{i}@yopmail.com",
        password: "adminadmin",
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        role: "user",
        can_post: true,
        post_count: 3,
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        address: Faker::Address.full_address,
        city: cities[rand(0..cities.size)],
        offer_type: ''
    )
end


5.times do |i|
    types_obj << Type.create(
        name: types[i],
        description: Faker::Lorem.paragraph(sentence_count: 5)
    )
end

features.each do |feat|
    features_obj << Feature.create(
        name: feat,
        description: Faker::Lorem.paragraph(sentence_count: 5)
    )
end

_features = Feature.all

houses.each_with_index do |house, i|
    # puts house[:title]
    # _status = status.sample

    if house[:status] == 'sell'
        # price = rand(10000000..30000000)
        price = [20000000, 35000000, 45000000, 65000000]
    else house[:status] == 'rent'
        price = [1000000, 1400000, 1500000, 1800000, 2000000, 3000000]
    end

    _house = House.new(
        # title: "House #{i+1}",
        # description: Faker::Lorem.paragraph(sentence_count: 15),
        title: house[:title],
        description: house[:description],
        room_number: rand(5..15),
        address: Faker::Address.full_address,
        price: price.sample,
        # status: _status,
        status: house[:status],
        is_available: true,
        district: District.all.sample,
        user: User.all.sample,
        type: Type.all.sample,
        # district: districts.sample,
        # user: users.sample,
        # type: types_obj.sample,
    )

    i += 1
    
    4.times do |ii|
        ii += 1
        _house.photos.attach(io: File.open(File.join(Rails.root,"app/assets/images/houses/house#{i}/#{ii}.jpg")), filename: "#{ii}.jpg")
    end


    # file = File.open(Rails.root.join('app', 'assets', 'images', 'img_5.jpg'))
    _house.photos.attach(io: File.open(File.join(Rails.root,'app/assets/images/img_5.jpg')), filename: 'img_5.jpg')
    # _house.photos.attach(File.open(File.join(Rails.root,'app/assets/images/img_5.jpg')))

    rand(3..features_obj.length).times do |i|
        _house.features.push(features_obj.sample);
    end

    _house.features.push(Feature.all.sample(rand(3..features.length)))

    _house.save

end
