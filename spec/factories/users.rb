# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Jane' }
    last_name { 'Doe' }
    phone_number { '+254712000000' }
    email { 'janedoe@gmail.com' }
    password { '@&*6A&Jb7!WRaPaR' }
    password_confirmation { '@&*6A&Jb7!WRaPaR' }
  end
end
