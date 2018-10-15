desc "This task is called by the Heroku scheduler add-on"


task :whatever do
require 'json'
require 'open-uri'

 url = 'http://free.currencyconverterapi.com/api/v5/convert?q=COP_USD&compact=y'
 trm_serialized = open(url).read
 today_trm = JSON.parse(trm_serialized)
 puts today_trm
  a = Trm.new
  a.dollar = today_trm["COP_USD"]["val"]
  puts a.dollar
  a.save
end

