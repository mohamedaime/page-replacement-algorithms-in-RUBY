class FIFO
  def initialize(memory_size)
    @memory_size = memory_size
    @memory = []
  end

  def access_page(page)
    if @memory.include?(page)
      puts "Page #{page} is already in memory."
    else
      if @memory.size >= @memory_size
        removed_page = @memory.shift
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
fifo = FIFO.new(3)
fifo.access_page(1)
fifo.access_page(2)
fifo.access_page(3)
fifo.access_page(4) # This will replace page 1
fifo.show_memory
