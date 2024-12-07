class LRU
  def initialize(memory_size)
    @memory_size = memory_size
    @memory = []
  end

  def access_page(page)
    if @memory.include?(page)
      puts "Page #{page} is already in memory."
      # Move the accessed page to the front (most recent)
      @memory.delete(page)
      @memory.unshift(page)
    else
      if @memory.size >= @memory_size
        removed_page = @memory.pop # Remove the least recently used page (from the back)
        puts "Page #{removed_page} removed."
      end
      @memory.unshift(page) # Add the new page to the front (most recent)
      puts "Page #{page} added to memory."
    end
  end

  def show_memory
    puts "Current memory: #{@memory}"
  end
end

# Example usage
lru = LRU.new(3)
lru.access_page(1)
lru.access_page(2)
lru.access_page(3)
lru.access_page(4)  # This will replace page 1 (least recently used)
lru.access_page(2)  # This will move page 2 to the front (most recently used)
lru.show_memory
