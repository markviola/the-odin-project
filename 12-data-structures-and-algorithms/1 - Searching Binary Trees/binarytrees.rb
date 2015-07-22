class Node
	def initialize
		@value
		@parent
		@left_child
		@right_child
	end

	def setValue(value)
		@value = value
	end

	def setParent(parent)
		@parent = parent
	end

	def setLeftChild(left_child)
		@left_child = left_child
	end

	def setRightChild(right_child)
		@right_child = right_child
	end

	def getValue
		return @value
	end

	def getParent
		return @parent
	end

	def getLeftChild
		return @left_child
	end

	def getRightChild
		return @right_child
	end
end

#Takes a sorted array and creates a binary tree
def build_tree(in_array, parent = nil)
	if in_array.length > 0
		middle = Node.new
		middle.setValue(in_array[in_array.length/2])
		if in_array.length/2 > 0
			middle.setRightChild(build_tree(in_array[(in_array.length/2 + 1)...in_array.length], middle))
			middle.setLeftChild(build_tree(in_array[0...(in_array.length/2)], middle))
		end
		return middle
	end
end

#Use BFS to find node
def breadth_first_search(value, root_node)
	queue = Queue.new
	queue << root_node

	until queue.empty? do
		current_node = queue.pop
		return current_node if current_node.getValue == value
		queue << current_node.getLeftChild if current_node.getLeftChild != nil
		queue << current_node.getRightChild if current_node.getRightChild != nil
	end

	return nil
end

#Use DFS to find node
def depth_first_search(value, root_node)
	stack = [] << root_node
	current_node = stack.pop

	until stack.empty? == nil
		return current_node if current_node.getValue == value
		stack << current_node.getRightChild if current_node.getRightChild != nil
		stack << current_node.getLeftChild if current_node.getLeftChild != nil
		current_node = stack.pop
	end
end

#User DFS to find node and uses a recursive function
def dfs_rec(value, node)
	if node.getValue == value
		return node
	else
		left_tree = dfs_rec(value, node.getLeftChild) if node.getLeftChild != nil
		return left_tree if left_tree != nil && left_tree.getValue == value
		right_tree = dfs_rec(value, node.getRightChild) if node.getRightChild != nil
		return right_tree if right_tree != nil && right_tree.getValue == value
		return nil
	end
end

BTS = build_tree([1,2,3,4,5,6])
puts breadth_first_search(5, BTS)
puts depth_first_search(5, BTS)
puts dfs_rec(5, BTS)