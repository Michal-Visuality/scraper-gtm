class Website < ApplicationRecord
  validates :url, presence: true

	def self.import(file)
	    CSV.foreach(file.path, headers: true) do |row|
	        website_hash = Website.new
	        website_hash.url = row[0]
	        website_hash.last_checked = ''
	        website_hash.has_gtm = ''
	        website_hash.save
	    end
	end
end
