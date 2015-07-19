require 'socket'
require 'json'

server = TCPServer.open(2000)

loop do
	Thread.start(server.accept) do |client|
		
		request = client.read_nonblock(256)
		request_header, request_body = request.split("\r\n\r\n", 2)
		request_type = request_header.split[0]
		file_name = request_header.split[1][1..-1]

		if File.exist?(file_name)
			response = File.read(file_name)
			client.puts "HTTP/1.0 200 OK\r\n#{Time.now.ctime}\r\nContent-Type: text/html\r\nContent-Length: #{response.length}\r\n\r\n"
			if request_type == 'GET'
				client.puts response
			elsif request_type == 'POST'
				params = JSON.parse(request_body)
				user_info = "<li>Name: #{params['user']['name']}</li> <li>Email: #{params['user']['email']}</li>"
				client.puts response.gsub("<%= yield %>", user_info)
			else
				client.puts "Unknown request error"
			end
		else
			client.puts "HTTP/1.0 404 Not Found\r\n\r\n"
			client.puts "404 Error"
		end
		client.close
	end
end