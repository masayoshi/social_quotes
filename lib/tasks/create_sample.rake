namespace :db do
  task :create_sample => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke 
    make_quotes
  end
end

def make_quotes
  20.times do
    Quote.create(:body => Faker::Lorem.sentence(10),
                 :reference => Faker::Name.name,
                 :remark => Faker::Lorem.sentence(10))
  end
end

