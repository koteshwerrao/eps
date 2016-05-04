# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
merchant = Merchant.new(email: 'eps@admin.com', password: 'eps1234',password_confirmation: 'eps1234')
merchant.skip_confirmation!
merchant.save!
user = User.create(:merchant_id => merchant.id,:role => "admin")
