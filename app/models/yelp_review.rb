class YelpReview < ApplicationRecord
  require 'yelp'
  @@client_yelp = Yelp::Client.new({ consumer_key: Figaro.env.yelp_consumer_key,
                              consumer_secret: Figaro.env.yelp_consumer_secret,
                              token: Figaro.env.yelp_access_token,
                              token_secret: Figaro.env.yelp_access_secret
                            })

  def self.get_business(business_search)
    params = { term: business_search, limit: 4}
    @@client_yelp.search('Toronto',params).businesses
  end
end
