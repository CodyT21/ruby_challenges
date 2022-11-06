require 'pry-byebug'

class Element
  # methods
  #   - initialize
  #     - accepts 2 parameters, an integer and an object of type Element (optional)
  #   - tail?
  #     - returns boolean of whether there is a next element
  #   - next
  #     - returns next element or nil if no next element
  #   - datum
  #     - returns value of the Element object
  
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  # methods
  #   - initialize
  #     - accepts no parameters
  #   - size
  #     - returns number of elements in the list
  #   - empty?
  #     - return boolean of whether list contains elements
  #   - push
  #     - appends element to end of the list
  #   - pop
  #     - returns last value of element in the list and removes it
  #   - peek
  #     - return last value of element in the list
  #   - head
  #     - returns last element in the list (object of type Element)
  #   - from_a (class method)
  #     - accepts 1 parameter (array)
  #     - fills list with array elements
  #     - last element of array is added to the linked list first
  #   - to_a
  #     - returns linked list converted to array using element values

  attr_accessor :head

  def initialize
    @head = nil
  end

  def size
    num_elements = 0
    current_ele = head
    until current_ele.nil?
      num_elements += 1
      current_ele = current_ele.next
    end
    num_elements
  end

  def empty?
    size == 0
  end

  def push(ele)
    self.head = Element.new(ele, head)
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def pop
    datum = head.datum
    new_head = head.next
    self.head = new_head
    datum
  end

  def self.from_a(arr)
    return self.new if arr.nil? || arr.empty?
    linked_list = self.new
    arr.reverse.each { |ele| linked_list.push(ele) }
    linked_list
  end

  def to_a
    arr = []
    current_ele = head

    until current_ele.nil?
      arr << current_ele.datum
      current_ele = current_ele.next
    end
    arr
  end

  def reverse
    list_elements = []
    current_ele = head

    until current_ele.nil?
      list_elements << current_ele.datum
      current_ele = current_ele.next
    end

    self.class.from_a(list_elements.reverse)
  end

end