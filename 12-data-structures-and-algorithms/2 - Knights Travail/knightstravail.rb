require 'thread'

class KnightNode
	def initialize(parent, coord)
		@coord = coord
		@children = []
		@parent = parent
		find_children
	end

	def find_children 
		for i in 0...8
			for j in 0...8
				@children << [i, j] if (is_knight_move(@coord, i, j) && valid_coord([i, j]))
			end
		end
	end

	def get_children
		return @children
	end

	def get_coord
		return @coord
	end

	def get_parent 
		return @parent
	end
end

#Uses breadth first search to find shortest path
def knight_moves(start_coord, end_coord)
	queue = Queue.new
	node = KnightNode.new(nil, start_coord)
	queue << node
	path = []

	until queue.empty? do 
		current_node = queue.pop

		if current_node.get_coord == end_coord
			loop do
				path += [current_node.get_coord]
				break if current_node.get_parent == nil
				current_node = current_node.get_parent
			end

			return path 
		end

		for i in 0...current_node.get_children.length
			queue << KnightNode.new(current_node, current_node.get_children[i])
		end
	end

	return nil
end

def is_knight_move(start_coord, new_x, new_y)
	if ((new_x - start_coord[0]).abs == 1) && ((new_y - start_coord[1]).abs == 2)
		return true
	elsif ((new_x - start_coord[0]).abs == 2) && ((new_y - start_coord[1]).abs == 1)
		return true
	else
		return false
	end
end

def valid_coord(end_coord)
	return true if (end_coord[0] >= 0) && (end_coord[0] < 8) && 
						(end_coord[1] >= 0) && (end_coord[1] < 8)
	return false
end

def print_path(path_stack)
	puts "\nYou made it in " + (path_stack.length-1).to_s + " moves! Here's your path:"

	until path_stack.empty?
		print path_stack.pop 
		puts ""
	end
end

path_stack = knight_moves([3,3], [4,3])
print_path(path_stack)