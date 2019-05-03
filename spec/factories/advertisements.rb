# frozen_string_literal: true

FactoryBot.define do
  factory :advertisement do
    location { 'Kisumu' }
    category { 'Electronic' }
    type { 'Phone' }
    model { 'Samsung' }
    price { 10_000 }
    user { nil }
  end
end
