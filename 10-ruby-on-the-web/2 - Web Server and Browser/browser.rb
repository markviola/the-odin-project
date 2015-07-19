require 'socket'
require 'json'

host = 'localhost'
port = 2000
path = "/index.html"

answer = ""
until answer == "GET" or answer == "POST"
	print "What is your request(GET or POST): "
	answer = gets.chomp
end

if answer == 'GET'
	request = "GET #{path} HTTP/1.0\r\n\r\n"
elsif answer == 'POST'
	user_info = Hash.new(0)
	print "Enter your name: "
	name = gets.chomp
	print "Enter your email: "
	email = gets.chomp
	user_info = {:user => {:name => name, :email => email} }
	request = "POST /thanks.html HTTP/1.0\r\nContent-Length: #{user_info.to_json.length}\r\n\r\n#{user_info.to_json}"
end

socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n", 2)

print headers
print body