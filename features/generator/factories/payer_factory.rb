# frozen_string_literal: true

FactoryBot.define do
  factory :payer, class: 'Hash' do
    first_name { Faker::Name.first_name.gsub(/[^0-9A-Za-z]/, '') }
    last_name { Faker::Name.last_name.gsub(/[^0-9A-Za-z]/, '') }
    email { Faker::Internet.email(name: username) }
    zip { Faker::Internet.email(name: username) }
    city { Faker::Internet.email(name: username) }
    country { Faker::Internet.email(name: username) }
  end
end
