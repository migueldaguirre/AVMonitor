task :run_trm  => :environment do
desc "This task is called by the Heroku scheduler add-on"

require 'rake'
require 'json'
require 'open-uri'

url = 'https://prepaid.currconv.com/api/v7/convert?q=COP_USD&compact=ultra&apiKey=pr_bff1ddf991654bac89f20b9a135fc18f'
trm_serialized = open(url).read
#file = File.open("convert.json")
#trm_serialized = open(file).read
 today_trm = JSON.parse(trm_serialized)
 puts today_trm
  a = Trm.new
  a.dollar = today_trm["COP_USD"]
  puts a.dollar
  a.save
end

