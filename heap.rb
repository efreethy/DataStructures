class Heap

	def initialize(vals = [])
	  @store = []
 	  vals.each { |val| insert(val) }
	end

  def peek_min
  	@store.first
  end

  def swap(i1, i2)
  	@store[i2], @store[i2] = @store[i2], @store[i1]
  end

  # heapifying down
  def pop_min
    return nil if @store.empty?
    swap(0,-1)
    min = @store.pop
    heapify_down!
    min
  end

  def insert(val)
   @store << val
   heapify_up!
  end

private

  def heapify_down
    i = 0
    loop do
      smallest_child = children_idx(i)
                        .min_by { |idx| @store[idx] }
      break if smallest_child.nil?
      if @store[i] > @store[smallest_child]
        swap(i, smallest_child)
        i = smallest_child
      end
      break
    end
  end

  def heapify_up
    i = @store.length - 1
    while (i > 0)
      parent = parent_idx(i)
      if (@store[i] < @store[parent])
        swap(i, parent)
        i = parent
      else
        break
      end
    end
  end

  def parent_index(i)
    i.zero? ? 0 : (i - 1)/2
  end

  def children_idx(i)
      [2*i + 1, 2*i + 2].select { |idx| idx < @store.length }
  end

end
