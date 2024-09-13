people = [
  { name: "Joshua", national_id: 334, age: 32 },
  { name: "Precious", national_id: 544, age: 50 },
  { name: "Jerome", national_id: 367, age: 65 },
  { name: "Jose", national_id: 965, age: 29 },
  { name: "Jarl", national_id: 421, age: 28 },
  { name: "Jerald", national_id: 742, age: 24 },
  { name: "Jean", national_id: 235, age: 21 },
  { name: "Rose", national_id: 654, age: 24 },
  { name: "Renzo", national_id: 975, age: 25 },
  { name: "Ivan", national_id: 786, age: 21 },
  { name: "Renier", national_id: 556, age: 19 },
  { name: "Eren", national_id: 557, age: 15 },
  { name: "West", national_id: 667, age: 17 },
  { name: "Jazer", national_id: 669, age: 10 },
  { name: "Percy", national_id: 663, age: 17 },
  { name: "Harry Potter", national_id: 321, age: 16 },
  { name: "Manny", national_id: 236, age: 23 },
  { name: "Ronaldo", national_id: 237, age: 31 },
  { name: "Mae", national_id: 194, age: 24 },
  { name: "Marry", national_id: 118, age: 12 },
]
choice = 0
while true
  puts "\nSelect"
  puts "[1]add to user"
  puts "[2]delete to user"
  puts "[3]search"
  puts "[4]edit"
  puts "[5]exit"

  choice = gets.chomp.to_i

  if choice == 1
    p "enter a national id"
    national_id = gets.chomp.to_i
    p "enter a name"
    name = gets.chomp
    p "enter a age"
    age = gets.chomp.to_i
    unique = true
    people.each_index do |x|
      if people[x][:national_id] == national_id
        unique = false
      end
    end
    if unique
      puts "User added successfully!"
      new_user = { name: name, national_id: national_id, age: age }
      people.unshift(new_user)
      people.first(20).each do |person|
        print "Name: #{person[:name]}, National id: #{person[:national_id]}, Age: #{person[:age]}\n"
      end
    else
      puts "Failed to add: National ID already exists."
    end

  elsif choice == 2
    puts "enter the national id"
    national_id = gets.chomp.to_i
    is_found = false
    index_found = 0
    people.each_index do |x|
      if people[x][:national_id] == national_id
        is_found = true
        index_found = x
      end
    end
    if is_found
      people = people.delete_if { |x| x[:national_id] == national_id }
      puts "Successfully deleted."
      people.first(20).each do |person|
        print "Name: #{person[:name]}, National id: #{person[:national_id]}, Age: #{person[:age]}\n"
      end
    else
      puts "User not found."
    end

  elsif choice == 3
    puts "\nSelect"
    puts "[1]search by ID"
    puts "[2]search by name"
    choice_2 = gets.chomp.to_i
    if choice_2 == 1
      puts "enter your ID"
      search_input = gets.chomp.to_i
      searched = people.select { |x| x[:national_id] == search_input }
      if searched == []
        puts "User not dounf"
      else
        puts "\nThe details are:\nName :#{searched[0][:name]}\nNational id :#{searched[0][:national_id]}\nAge :#{searched[0][:age]}"
      end
    end

    if choice_2 == 2
      puts "enter you name"
      search_input = gets.chomp
      searched = people.select { |x| x[:name] == search_input }
      if searched == []
        puts "User not dounf"
      else
        puts "\nThe details are:\nName :#{searched[0][:name]}\nNational id :#{searched[0][:national_id]}\nAge :#{searched[0][:age]}"
      end
    end

  elsif choice == 4
    puts "enter your National ID"
    search_input = gets.chomp.to_i
    searched = people.select { |x| x[:national_id] == search_input }
    if searched == []
      puts "User not dounf"
    else
      # puts "\nThe details are:\nName :#{searched[0][:name]}\nNational id :#{searched[0][:national_id]}\nAge :#{searched[0][:age]}"
      puts "enter your new name"
      new_name = gets.chomp
      puts "enter your new age"
      new_age = gets.chomp
      people.each_index do |x|
        if people[x][:national_id] == search_input
          people[x][:name] = new_name
          people[x][:age] = new_age
        end
      end
      people.first(20).each do |person|
        print "Name: #{person[:name]}, National id: #{person[:national_id]}, Age: #{person[:age]}\n"
      end
    end

  elsif choice == 5
    puts "Are you sure you want to exit (y/n)?"
    exit = gets.chomp
    if exit == 'y'
      break
    end
  end
end
