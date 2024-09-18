class Person
  attr_accessor :name, :age, :national_id
  @@records = []

  def save
    @@records.prepend(self)
  end

  def self.all
    return  @@records
  end

  def self.first
    return @@records.first
  end

  def self.last
    return @@records.last
  end

  def display
    puts "Name: #{self.name}"
    puts "Age: #{self.age}"
    puts "National Id: #{self.national_id}"
  end

  def self.find_by_national_id (search_id)
    return @@records.find { |record| record.national_id == search_id }
  end

  def self.search_name (name)
    return @@records.find { |person| person.name == name }
  end

  def self.search_id (id)
    return @@records.find { |person| person.national_id == id }
  end

  def destroy
    @@records.delete(self)
  end

  def self.destroy_all
    @@records.clear
  end
  def update

  end
end

person_1 = Person.new
person_1.name = "jerome"
person_1.age = 18
person_1.national_id = 23131
person_1.save

person_1 = Person.new
person_1.name = "jarl"
person_1.age = 20
person_1.national_id = 123
person_1.save

# p Person.search_name("jarl")
# p Person.search_id(123)
# Person.destory_all
Person.destroy_all
p Person.all
def add_user(people)
  p "Enter your national id"
  national_id = gets.chomp.to_i
  p "Enter your name"
  name = gets.chomp
  p "Enter your age"
  age = gets.chomp.to_i
  unique = true
  people.each_index do |person|
    if people[person][:national_id] == national_id
      unique = false
    end
  end
  if unique
    puts "User added successfully!"
    new_user = { name: name, national_id: national_id, age: age }
    people.unshift(new_user)
    show_user(people)
  else
    puts "Failed to add: National ID already exists."
  end
end

def delete_user(people)
  puts "Enter the national id"
  national_id = gets.chomp.to_i
  is_found = false
  people.each_index do |person|
    if people[person][:national_id] == national_id
      is_found = true
    end
  end
  if is_found
    people = people.delete_if { |person| person[:national_id] == national_id }
    puts "Successfully deleted."
    show_user(people)
  else
    puts "User not found."
  end
end

def search_user(people)
  puts "\nSelect"
  puts "[1] Search by ID"
  puts "[2] Search by name"
  choice = gets.chomp.to_i
  if choice == 1
    puts "Enter your ID"
    search_input = gets.chomp.to_i
    searched = people.select { |person| person[:national_id] == search_input }
    if searched == []
      puts "User not dounf"
    else
      puts "\nThe details are:\nName :#{searched[0][:name]}\nNational id :#{searched[0][:national_id]}\nAge :#{searched[0][:age]}"
    end
  end

  if choice == 2
    puts "Enter your name"
    search_input = gets.chomp
    searched = people.select { |person| person[:name] == search_input }
    if searched == []
      puts "User not dounf"
    else
      puts "\nThe details are:\nName :#{searched[0][:name]}\nNational id :#{searched[0][:national_id]}\nAge :#{searched[0][:age]}"
    end
  end
end

def edit_user(people)
  puts "Enter your National ID"
  search_input = gets.chomp.to_i
  searched = people.select { |person| person[:national_id] == search_input }
  if searched == []
    puts "User not dounf"
  else
    puts "enter your new name"
    new_name = gets.chomp
    puts "enter your new age"
    new_age = gets.chomp
    people.each_index do |person|
      if people[person][:national_id] == search_input
        people[person][:name] = new_name
        people[person][:age] = new_age
      end
    end
    show_user(people)
  end
end

def exit_program
  puts "Are you sure you want to exit (y/n)?"
  choice = gets.chomp
  exit if choice == 'y'
end

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

def show_user(people)
  people.first(5).each do |person|
    print "Name: #{person[:name]}, National id: #{person[:national_id]}, Age: #{person[:age]}\n"
  end
end

puts "List of People"
show_user(people)

while true
  puts "\nChoose an option"
  puts "[1]add a user"
  puts "[2]delete a user"
  puts "[3]search a user"
  puts "[4]edit a user"
  puts "[5]exit"

  choice = gets.chomp.to_i
  system("clear")
  if choice == 1
    add_user(people)
  elsif choice == 2
    delete_user(people)
  elsif choice == 3
    search_user(people)
  elsif choice == 4
    edit_user(people)
  elsif choice == 5
    exit_program
  end
end
