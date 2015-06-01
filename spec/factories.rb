FactoryGirl.define do
  factory :family do
    surname       { Faker::Name.last_name }
    email         { Faker::Internet.email }
    password      { Faker::Lorem.characters(10) }
  end

  factory :member do
  	role 					{ Faker::Lorem.characters(4) }
  	name 					{ Faker::Name.first_name }
  	association   :family, factory: :family
  	color					{ Faker::Lorem.characters(4) }
  	img_url				{ Faker::Internet.url }
  end

  factory :task do
    title         { Faker::Lorem.sentence }
    point_value   { Faker::Number.digit }
    association   :family, factory: :family
    deadline      { Faker::Date.forward(7) }
  end

  factory :event do
    title         { Faker::Lorem.sentence }
    event_date    { Faker::Date.forward(7) }
    event_time    { Faker::Time.forward(2)}
    association   :family, factory: :family
  end

  factory :reward do
    name          { Faker::Lorem.sentence }
    cost          { Faker::Number.digit }
    association   :family, factory: :family
  end

  factory :medal do
    title         { Faker::Lorem.sentence }
    img_url       { Faker::Internet.url }
  end
  
end