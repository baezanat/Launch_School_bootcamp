class CircularQueue

  def initialize(buffer_size)
    @objects = Array.new(buffer_size)
  end

  def enqueue(new_object)
    if objects[-1] == nil
      objects.pop
      objects << new_object
    else
      objects.shift
      objects << new_object
    end
  end

  def dequeue
    return nil unless objects.any? { |object| object != nil }
    objects << nil
    objects.each_with_index do |object, index|
      if object != nil
        return objects.delete_at(index)
      end
    end
  end

  private

  attr_accessor :objects
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil
queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1
queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
