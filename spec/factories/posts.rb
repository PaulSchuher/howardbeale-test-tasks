# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
  end

  factory :post_with_wrong_permalink, class: Post do
    title Faker::Lorem.sentence
    permalink '(  )90-`'
  end

  factory :post_with_permalink, class: Post do
    title Faker::Lorem.sentence
    permalink 'lorem_sentence-36478569'
  end
end
