class KnightNode
	def initialize(coord)
		@coord = coord
		@children = []
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
end


def knight_moves(start_coord, end_coord)
	found_path = []
	i = 0
	path = [start_coord]
	found = false
	current_node = KnightNode.new(start_coord)

	if(start_coord == end_coord)
		return path, true
	else 
		while (i < current_node.get_children.length) && (!found)
			if current_node.get_children[i] == end_coord
				puts "in here"
				path += [current_node.get_children[i]]
				found = true
				return path, found
			end
			i += 1
		end

		for i in 0...current_node.get_children.length
			found_path, found = knight_moves(current_node.get_children[i], end_coord)
			if found 
				path += found_path
				return found_path, found
			end
		end
	end
	
	return path, found
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

print knight_moves([0,0], [4,2])