#!/usr/bin/ruby -w

# Anthony Giacalone
# CECS 424
# September 10, 2011
# Assignment 2
# Array partitioner

puts "Input an integer to represent the number of elements in the array: \n"
n = gets.to_i
counter = 1
array = []

# While loop to fill the array with values, up to n
while (counter <= n)
    print "Enter element " ,counter, "\n"
    array.push(gets.to_i)
    counter += 1
end

# Save the original array for displaying once the algorithm is done
input_array = array.join(" ")

puts "Now, enter a test value: "
x = gets.to_i

left = 0                      # The left marker
right = n-1                   # The right marker

# The array partition algorithm
while left <= right

    # Check to see if the left and right indicies equal each other
    if (array[left] == array[right])
        right -= 1

    # If the left index is larger than x and the right is smaller, swap the two
    elsif (array[left] > x) && (array[right] <= x)
        array[left], array[right] = array[right], array[left]
        left += 1
        right -= 1  

    # If the left index only is bad, decrement the right and keep going
    elsif (array[left] > x) && (array[right] > x)
        right -= 1

    # If the right index only is bad, increment the left and keep going
    elsif (array[left] <= x) && (array[right] < x)
        left += 1

    # If both are okay, increment/decrement and keep going
    # elsif (array[left] <= x) && (array[right] > x)
    else
        left += 1
        right -= 1
    end
end

# Calculate the partition index 
p = array.select {|z| z<=x}.length-1


# Display the results to the user
output_array = array.join(" ")
puts "\nInput Array: ", input_array
puts "\nOutput Array: ", array.join(" ")
puts "\nPartition Index: ", p
