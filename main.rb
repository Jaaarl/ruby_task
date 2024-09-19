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
    puts "Name: #{self.name}, Age: #{self.age}, National Id: #{self.national_id}"
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

  def self.count
    return @@records.size
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

def show_user
  # people.first(5).each do |person|
  #   print "Name: #{person[:name]}, National id: #{person[:national_id]}, Age: #{person[:age]}\n"
  # end
  Person.all.each do |person1|
    person1.display
  end
end
def add_user
  new_person = Person.new
  puts "Enter your national id"
  new_person.national_id = gets.chomp.to_i
  puts "Enter your name"
  new_person.name = gets.chomp
  puts "Enter your age"
  new_person.age = gets.chomp.to_i
  # puts new_Person.national_id
  if Person.search_id(new_person.national_id) == nil
    new_person.save
  else
    puts "Failed to add: National ID already exists"
  end
end

def delete_user
  person = Person.new
  puts "Enter the national id"
  person = Person.search_id(gets.chomp.to_i)
  if person == nil
    puts "User not dounf"
  else
    person.destroy
    show_user
  end
end

def search_user
  puts "\nSelect"
  puts "[1] Search by ID"
  puts "[2] Search by name"
  choice = gets.chomp.to_i
  if choice == 1
    puts "Enter your ID"
    person = Person.search_id(gets.chomp.to_i)
    if person == nil
      puts "User not dounf"
    else
      person.display
    end
  end
  if choice == 2
    puts "Enter your name"
    person = Person.search_name(gets.chomp)
    if person == nil
      puts "User not dounf"
    else
      person.display
    end
  end
end

def edit_user
  puts "Enter your National ID"
  person = Person.new
  person = Person.find_by_national_id(gets.chomp.to_i)
  if person == nil
    puts "User not dounf"
  else
      person_index = Person.all.find_index(person)
      puts "Enter your new name"
      person.name = gets.chomp
      puts "Enter your new age"
      person.age = gets.chomp
      Person.all[person_index] = person
    show_user
  end
end

def exit_program
  puts "Are you sure you want to exit (y/n)?"
  choice = gets.chomp
  exit if choice == 'y'
end

# people = [
#   { name: "Joshua", national_id: 334, age: 32 },
#   { name: "Precious", national_id: 544, age: 50 },
#   { name: "Jerome", national_id: 367, age: 65 },
#   { name: "Jose", national_id: 965, age: 29 },
#   { name: "Jarl", national_id: 421, age: 28 },
#   { name: "Jerald", national_id: 742, age: 24 },
#   { name: "Jean", national_id: 235, age: 21 },
#   { name: "Rose", national_id: 654, age: 24 },
#   { name: "Renzo", national_id: 975, age: 25 },
#   { name: "Ivan", national_id: 786, age: 21 },
#   { name: "Renier", national_id: 556, age: 19 },
#   { name: "Eren", national_id: 557, age: 15 },
#   { name: "West", national_id: 667, age: 17 },
#   { name: "Jazer", national_id: 669, age: 10 },
#   { name: "Percy", national_id: 663, age: 17 },
#   { name: "Harry Potter", national_id: 321, age: 16 },
#   { name: "Manny", national_id: 236, age: 23 },
#   { name: "Ronaldo", national_id: 237, age: 31 },
#   { name: "Mae", national_id: 194, age: 24 },
#   { name: "Marry", national_id: 118, age: 12 },
# ]



puts "List of People"
show_user

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
    add_user
  elsif choice == 2
    delete_user
  elsif choice == 3
    search_user
  elsif choice == 4
    edit_user
    # update
  elsif choice == 5
    exit_program
  end
end
