class LIFO
  def initialize(memory_size)
    @memory_size = memory_size
    @memory = []
  end

  def access_page(page)
    if @memory.include?(page)
      puts "Page #{page} is already in memory."
    else
      if @memory.size >= @memory_size
        removed_page = @memory.pop
        puts "Page #{removed_page} removed."
      end
      @memory.push(page)
      puts "Page #{page} added to memory."
    end
  end

  def show_memory
    puts "Current memory: #{@memory}"
  end
end

# Example usage
lifo = LIFO.new(3)
lifo.access_page(1)
lifo.access_page(2)
lifo.access_page(3)
lifo.access_page(4) # This will replace page 3
lifo.show_memory
