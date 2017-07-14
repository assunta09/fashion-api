FactoryGirl.define do
  factory :product do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentences(sentence_count = 3, supplemental = false) }
    details { Faker::Lorem.sentences(sentence_count = 3, supplemental = false) }
    price { 30.5 }
    link {'https://www.zalando.de/armedangels-mathilda-shorts-ar321s005-m11.html?zoom=true'}
  end
end