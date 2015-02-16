require 'sham_rack'

ShamRack.at('www.google.co.jp') do |env|
  if env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'] == '/'
    ['200 OK', { 'Content-type' => 'text/plain'}, ['Hello, world!']]
  end
end

response = Net::HTTP.new('www.google.co.jp', 80).get('/')
puts response.code
puts response.body
