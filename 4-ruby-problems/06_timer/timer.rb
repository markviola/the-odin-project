class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		time_hours = @seconds / 3600
		time_minutes = (@seconds % 3600)/60
		time_seconds = (@seconds % 3600)%60
		
		return helper(time_hours) + ':' + helper(time_minutes) + ':' + helper(time_seconds)
	end

	def helper(time)
		if time < 10
			return '0' + time.to_s
		end
		return time.to_s
	end
end