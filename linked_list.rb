class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(value) #adds a new node containing value to the end of the list
    new_node = Node.new(value)
    if self.head.nil?
      self.head = new_node
      return self.head
    end
    tail.next_node = new_node
  end
 
  def prepend(value) #adds a new node containing value to the start of the list
    if self.head.nil?
      self.head = Node.new(value)
    else
      self.head = Node.new(value, head)
    end
  end

  def size #returns the total number of nodes in the list
    size = 0
    return 0 if self.head == nil 
    current_node = self.head
    until current_node == nil
      current_node = current_node.next_node
      size += 1
    end
    size
  end

  def head #returns the first node in the list
    @head
  end

  def tail #returns the last node in the list
    return self.head if self.head.nil?
    current_node = self.head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index) #returns the node at the given index
    return self.head if self.head.nil?
    current_node = self.head
    index.times do 
      current_node = current_node.next_node
    end
    current_node
  end

  def pop #removes the last element from the list
    last_element = self.tail
    current_node = self.head
    return nil if current_node.nil?
    until current_node.next_node == last_element
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end
  
  def contains?(value) #returns true if the passed in value is in the list and otherwise returns false.
    if self.head == nil
      return false
    end
    current_node = self.head
    contained_value = false
    until current_node == nil
      contained_value = true if current_node.value == value
      current_node = current_node.next_node
    end
    contained_value
  end

  def find(value) # returns the index of the node containing value, or nil if not found.
    current_node = self.head
    index = 0 
    return nil if current_node.nil?
    until current_node.value == value
      index += 1
      current_node = current_node.next_node
    end
    index
  end

  def insert_at(value, index) #inserts a new node with the provided value at the given index.
    return nil if self.head.nil?
    new_node = Node.new(value, self.at(index))
    self.at(index - 1).next_node = new_node
  end

  def remove_at(index) #removes the node at the given index.
    return nil if self.at(index) == nil
    current_node = self.head
    until current_node.next_node == self.at(index)
      current_node = current_node.next_node
    end
    current_node.next_node = self.at(index + 1)
  end

  def to_s #represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
    current_node = self.head
    return "nil" if current_node == nil
    until current_node == nil
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    print "nil"
  end

end

class Node
  attr_accessor :value, :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

my_list = LinkedList.new()
puts my_list
my_list.append("one")
my_list.append("two")
my_list.append("three")
puts my_list
p my_list.head
p my_list.tail
my_list.prepend("before one")
puts my_list
puts my_list.size
p my_list.at(0)
my_list.pop
puts my_list
puts "#{my_list.contains?('one')}"
puts "#{my_list.contains?('three')}"
puts "#{my_list.find('two')}"
my_list.append("three")
puts my_list
my_list.remove_at(1)
puts my_list
my_list.insert_at("new one", 1)
puts my_list
