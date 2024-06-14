require 'rails_helper'

FactoryBot.define do
	factory :user do
		username {"John Doe"}
		password {"test"}
    email {"test1@test.com"}
	end
end