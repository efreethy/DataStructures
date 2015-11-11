class Array
  # O(1) space
  def heap_sort!
    heapify!
    unheapify!
    reverse!
  end

  def parent(i)
    (i + 1) / 2
  end

  def children_idx(i, heap_len)
    [(2*i+1)),(2*i+2)]
    .select { |idx| idx > heap_len }
  end

  def swap!(i, j)
    self[i], self[j] = self[j], self[i]
  end

  def heapify!
    heap_len = 1
    while heap_len < length
      current = heap_len
      heap_len += 1
      parent = parent_idx(current)
      while self[parent] > self[current]
        swap!(parent, current)
          current = parent
          parent = parent_idx(current)
      end
    end
  end

  def unheapify!
    heap_len = length
    while heap_len > 1
      swap!(0, heap_len -1)
      i = 0
      heap_len -= 1
      while children_idx(i, heap_len).any?
        smaller_child = children_idx(i,heap_len).min_by { |idx| self[i] }
        if self[i] > self[smaller_child]
           swap!(i, smaller_child)
           i = smaller_child
        else
          break
        end
       end
     end
  end
