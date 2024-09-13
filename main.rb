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
    print "User added successfully!"
else
  print "Failed to add: National ID already exists."
end
new_user = { name: name, national_id: national_id, age: age }
people.push(new_user)