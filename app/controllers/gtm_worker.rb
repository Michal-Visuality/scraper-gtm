class GtmWorker
  include Sidekiq::Worker
  require 'csv'
  require 'open-uri'
  require 'openssl'

  def perform()
  	websites  = Website.all
  	websites.each { |n|
  		doc = Nokogiri::HTML(open(n.url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
  	  website_update = Website.find_by(id: n.id) 
  		if (doc.to_s.include? "gtm.start") == true
			  website_update.has_gtm = true
        website_update.save
  		end
      website_update.last_checked = Date.today.to_s
      website_update.save
  	}
    
  end
end