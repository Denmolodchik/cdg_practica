# frozen_string_literal: true
require 'ffaker'

FactoryBot.define do
    factory :follow do 
        follower
        following
    end
end