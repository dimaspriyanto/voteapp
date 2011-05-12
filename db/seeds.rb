# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
Role.destroy_all

Role.create!(:name => 'Admin')
Role.create!(:name => 'Public User')

admin = Role.first
user = Role.last

User.destroy_all
admin.users.create!(:username => 'admin', :password => 's3cret', :password_confirmation => 's3cret', :email => 'admin@domain.com')
user.users.create!(:username => 'user1', :password => 's3cret', :password_confirmation => 's3cret', :email => 'user1@domain.com')
user.users.create!(:username => 'user2', :password => 's3cret', :password_confirmation => 's3cret', :email => 'user2@mail.com')
user.users.create!(:username => 'user3', :password => 's3cret', :password_confirmation => 's3cret', :email => 'user3@domain.com')
