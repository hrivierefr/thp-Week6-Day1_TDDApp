require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "first_name should not be blank" do
		user = User.new

		user.first_name = ''
		user.name = Faker::Name.name
		user.email = Faker::Internet.email

		password = Faker::String.random(8)
		user.password = password
		user.password_confirmation = password
		
  		assert_not user.save
	end

	test "first_name should not be composed of spaces only" do
		user = User.new

		user.first_name = '     '
		user.name = Faker::Name.name
		user.email = Faker::Internet.email

		password = Faker::String.random(8)
		user.password = password
		user.password_confirmation = password

  		assert_not user.save
	end

	test "should not signup with an existing email" do
		10.times do			
			User.create(
				first_name: Faker::Name.first_name,
				name: Faker::Name.last_name,
				email: Faker::Internet.email,
				password: 'password',
				password_confirmation: 'password'
			)
		end

		user = User.new
		
		user.first_name = Faker::Name.first_name
		user.name = Faker::Name.name
		user.email = User.all[rand(User.count - 1)+1].email

		password = Faker::String.random(8)
		user.password = password
		user.password_confirmation = password

  		assert_not user.save
	end
end
