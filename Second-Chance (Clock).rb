class SecondChance
  def initialize(memory_size)
    @memory_size = memory_size
    @memory = []
    @reference_bits = []
    @pointer = 0
  end

  def access_page(page)
    if @memory.include?(page)
      puts "Page #{page} is already in memory."
      # Set the reference bit to 1
      @reference_bits[@memory.index(page)] = 1
    else
      if @memory.size >= @memory_size
        # Perform the second-chance algorithm
        replace_page(page)
      end
      @memory.push(page)
      @reference_bits.push(1) # Set the reference bit to 1 for the new page
      puts "Page #{page} added to memory."
    end
  end

  def replace_page(new_page)
    while @reference_bits[@pointer] == 1
      @reference_bits[@pointer] = 0
      @pointer = (@pointer + 1) % @memory_size
    end
    replaced_page = @memory[@pointer]
    @memory[@pointer] = new_page
    @reference_bits[@pointer] = 1
    puts "Page #{replaced_page} removed and replaced with page #{new_page}."
    @pointer = (@pointer + 1) % @memory_size
  end

  def show_memory
    puts "Current memory: #{@memory}"
  end
end

# Example usage
second_chance = SecondChance.new(3)
second_chance.access_page(1)
second_chance.access_page(2)
second_chance.access_page(3)
second_chance.access_page(4) # This will replace page 1 after checking its reference bit
second_chance.show_memory
