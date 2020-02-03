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
features = ['wc', 'douche', 'garage']
districts_hash = {
    "Analakely" => {
        latitude: -18.908281,
        longitude: 47.52692
    },
    "Itaosy" => {
        latitude: -18.908281,
        longitude: 47.470842
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
        latitude: -18.916398,
        longitude: 47.518638
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

10.times do |i|
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

20.times do |i|

    _status = status.sample

    if _status == 'sell'
        price = rand(10000000..30000000)
    else _status == 'rent'
        price = rand(100000..1000000)
    end

    house = House.create(
        title: "House #{i+1}",
        description: Faker::Lorem.paragraph(sentence_count: 15),
        room_number: rand(2..6),
        address: Faker::Address.full_address,
        price: price,
        status: _status,
        is_available: true,
        district: districts.sample,
        user: users.sample,
        type: types_obj.sample,
    )

    rand(2..features_obj.length).times do |i|
        house.features.push(features_obj.sample);
    end

end
