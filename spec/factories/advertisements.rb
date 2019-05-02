# frozen_string_literal: true

FactoryBot.define do
  factory :advertisement do
    location { 'MyString' }
    category { 'MyString' }
    type { '' }
    model { 'MyString' }
    price { 1 }
    user { nil }
  end
end
