# frozen_string_literal: true
require 'ffaker'

FactoryBot.define do
    factory :like do 
        association :post
        association :user
    end
end