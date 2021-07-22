# frozen_string_literal: true
require 'ffaker'

FactoryBot.define do
    factory :comment do 
        association :post

        username { }
        body { FFaker::Lorem.sentence }
    end
end