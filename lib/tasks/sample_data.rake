namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
     User.create!(name: "moyuanming",
                 email: "mo_yuan_ming@126.com",
                 password: "future",
                 password_confirmation: "future")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
   
    end
    
  end
  task addmicropost: :environment do
     users = User.all
    50.times do 
      content = Faker::Lorem.sentence(5)
      users.each { |user| Micropost.create!(content: content,user_id:user.id)}
    end
  end
   task AddRelationShip: :environment do
     users = User.all
    user  = users.first
    followed_users = users[2..50]
    followers      = users[3..40]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
   end
end