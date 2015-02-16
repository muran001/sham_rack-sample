require 'sham_rack'
require 'sinatra'

class MyApp < Sinatra::Application
  get '/dummy' do
    'hogehoge'
  end
end

ShamRack.at("rackup.xyz").rackup do
  run MyApp
end

response = Net::HTTP.new('rackup.xyz', 80).get('/dummy')
puts response.code
puts response.body
