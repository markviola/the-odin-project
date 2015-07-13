require 'jumpstart_auth'

class MicroBlogger
  	attr_reader :client, :followers, :friends

	def initialize
	    puts "Initializing..."
	    @client = JumpstartAuth.twitter
	    @followers = @client.followers.collect { |follower| @client.user(follower).screen_name }
	    @friends = @client.friends.collect { |friend| @client.user(friend) }
	end

	def run
	    puts "Welcome to the JSL Twitter Client!"
	    input = []

		while input[0] != "q"
		   	printf "enter command: "
		   	input = gets.chomp.split(" ")

		   	case input[0]
			    when 'q' then 
			    	puts "Goodbye!"
			    when 't' then 
			    	tweet(input[1..-1].join(" "))
			    when 'dm' then 
			    	dm(input[1], input[2..-1].join(" "))
			    when 'spam' then 
			    	spam_my_followers(input[1..-1].join(" "))
			    when 'lt' then
			    	everyones_last_tweet
			    else
			      puts "Sorry, I don't know how to #{input[0]}"
			end
		end
	end

	#Enter a tweet on your account
	def tweet(message)
	    if message.size > 140
	      	puts "Your tweet is over 140 characters!"
	    else
	      	@client.update(message)
	   	end
	end

	#Send a direct message to someone
	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message
		if @followers.include?(target)
  			message = "d @#{target} #{message}"
  			tweet(message)
  		else
  			puts "USER not following you!"
  		end
	end

	#return array of all followers
	def followers_list
		return @followers
	end

	#Send a message to all followers
	def spam_my_followers(message)
		for i in 0..@followers.length-1
			dm(@followers[i], message)
		end
	end

	#Prints the last tweet of all the people you're following
	def everyones_last_tweet
    	@friends.each do |friend|
      		puts "#{friend.screen_name} said..."
      		puts "#{friend.status.text}"
      		puts ""
    	end
  	end
end

blogger = MicroBlogger.new
blogger.run