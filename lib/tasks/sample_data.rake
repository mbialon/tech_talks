require 'faker'

namespace :db do

	desc "Fill database with sample data" 
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		User.create!(
					:email => "qwer@qwer.qwer",
					:password => "qwerqwer",
					:password_confirmation => "qwerqwer",
					:remember_me => false)
					
end
