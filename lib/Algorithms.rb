class Algorithms
  def shuffle(array)
    size = array.size
    (size - 1).downto(0) do |i|
       j = rand(i + 1)
       array[i], array[j] = array[j], array[i]
    end
    array
  end

  def group(list, num_of_groups)
    # create the right number of empty groups
    groups = num_of_groups.times.map { [] }

    # cycle through list
    index = 0
    list.each do |item|
       # add each list item to each group in turn
       groups[index] << item
       index += 1
       index = 0 if index > 3
    end
    # when there are no list items left return the groups
    groups
  end

  def duplicates(list)
  end
end
