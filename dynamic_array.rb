class DynamicArray
  attr_accessor :count, :length

  def initialize
    @count = 0
    @length = 2
    @store = Array.new(2)
  end

  def [](index)
    @store[index]
  end

  def []=(index, value)
    @store[index] = value
  end

  def push(num)
    if (@count <= @length - 1)
      @store[@count] = num
      @count += 1
    else
      new_store = Array.new(@length*2)
      @length *= 2
      @store.each_index { |i| new_store[i] = @store[i] }
      new_store[@count] = num
      @store = new_store
      @count += 1
    end
  end

  def size!
    @count
  end


end
