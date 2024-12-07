class Optimal
  def initialize(memory_size)
    @memory_size = memory_size
    @memory = []
  end

  def access_page(page, future_references)
    if @memory.include?(page)
      puts "Page #{page} is already in memory."
    else
      if @memory.size >= @memory_size
        # Find the page that will be used farthest in the future
        farthest_page = find_farthest_page(future_references)
        @memory.delete(farthest_page)
        puts "Page #{farthest_page} removed."
      end
      @memory.push(page)
      puts "Page #{page} added to memory."
    end
  end

  def find_farthest_page(future_references)
    farthest_page = nil
    farthest_distance = -1
    @memory.each do |page|
      future_index = future_references.index(page)
      if future_index.nil?
        return page # If page isn't used again, it should be replaced
      elsif future_index > farthest_distance
        farthest_distance = future_index
        farthest_page = page
      end
    end
    farthest_page
  end

  def show_memory
    puts "Current memory: #{@memory}"
  end
end

# Example usage
optimal = Optimal.new(3)
future_references = [1, 2, 3, 4, 1, 2, 5]
optimal.access_page(1, future_references)
optimal.access_page(2, future_references)
optimal.access_page(3, future_references)
optimal.access_page(4, future_references) # This will replace the farthest used page
optimal.show_memory
