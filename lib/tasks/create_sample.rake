namespace :db do
  task :create_sample => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    make_users
    make_quotes
  end
end

def make_users
  5.times do |n|
    email = "foobar#{n}@foo.bar"
    password  = "password"
    @tmp_user = User.new(:username => Faker::Name.name,
                         :email => email,
                         :password => password,
                         :password_confirmation => password)
    @tmp_user.skip_confirmation!
    @tmp_user.save!
  end
end

def make_quotes
  User.all.each do |user|
    20.times do
      user.quotes.create(:body => Faker::Lorem.sentence(20),
                         :reference => Faker::Name.name,
                         :remark => Faker::Lorem.sentence(10),
                         :tag_list => Faker::Lorem.words(10).join(','))
    end
  end
end

