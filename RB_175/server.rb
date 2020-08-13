require "socket"

# class Request
#   attr_reader :request_line
# 
#   def initialize(request_line)
#     @request_line = request_line
#   end
# 
#   def http_method
#     request_line.split(" ").first
#   end
# 
#   def http_version
#     request_line.split(" ").last
#   end
# 
#   def path
#     url[0..index_last_slash]
#   end
# 
#   def params
#     params_str = url[index_last_slash + 2..-1]
#     params_arr = params_str.split("&")
#     params_arr.each_with_object({}) do |str, hash|
#       key, value = str.split("=")
#       hash[key] = value
#     end
#     # params_arr.map { |str| str.split("=") }.to_h
#   end
# 
#   def sides
#     params["sides"].to_i
#   end
# 
#   def rolls
#     params["rolls"].to_i
#   end
# 
#   def to_s
#     request_line
#   end
# 
#   private
# 
#   def url
#     request_line.split(" ")[1]
#   end
# 
#   def index_last_slash
#     (url.reverse.index("/") * -1) - 1
#   end
# end
# 
# # ================ SERVER CODE USING REQUEST OBJECT =====================
# 
# server = TCPServer.new("localhost", 3003) # Server bound to port 3003
# 
# loop do
#   client = server.accept # Wait for a client to connect
# 
#   request_line = client.gets
#   next if !request_line || request_line =~ /favicon/
#   # puts request_line
#   request = Request.new(request_line)
#   puts request
# 
#   client.puts "HTTP/1.1 200 OK\r\n\r\n"
#   # client.puts "Content-Type: text/plain\r\n\r\n"
#   client.puts request
#   # client.puts request_line
#   client.puts "method is #{request.http_method}"
#   client.puts "version is #{request.http_version}"
#   client.puts "path is #{request.path}"
#   client.puts "params are #{request.params}"
#   client.puts "Dice with #{request.sides} sides are rolled #{request.rolls} times"
#   request.rolls.times { client.puts rand(request.sides) + 1}
#   client.close
# end

# ===================== SINGLE METHOD ======================= 
def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")

  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

# ================ SERVER CODE USING METHOD =====================
server = TCPServer.new("localhost", 3003) # Server bound to port 3003

loop do
  client = server.accept # Wait for a client to connect

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line
  next unless request_line

  http_method, path, params = parse_request(request_line)
  
  # client.puts "HTTP/1.1 200 OK"
  # client.puts "Content-Type: text/html"
  # client.puts
  client.puts "HTTP/1.1 200 OK\r\n"
  client.puts "Content-Type: text/html\r\n\r\n"

  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"

  client.puts "<h1>Rolls!</h1>"
  number = params["number"].to_i
  client.puts "<h1>Counter</h1>"
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'> Add one</a>"
  client.puts "<a href='?number=#{number - 1}'> Subtract one</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end

