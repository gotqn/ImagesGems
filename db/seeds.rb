# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Inserting default security users
users = {

    admin: {

        username: 'admin',
        email: 'tuvarna.system.master@gmail.com',
        password: 'adminpass',
        password_confirmation: 'adminpass',
        is_admin: true
    },

    administrator: {

        username: 'administrator',
        email: 'tuvarna.system.super.user@gmail.com',
        password: 'administrator',
        password_confirmation: 'administrator',
        is_admin: true
    }
}

users.each do |user, data|

  user = User.new(data)

  unless User.where(email: user.email).exists?
    user.save!
  end
end