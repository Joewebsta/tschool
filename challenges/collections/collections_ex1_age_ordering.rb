# 1: Age Ordering
#
# * Level 1: Write code that'll output the names (and only the names) in order by
# ascending age
# * Level 2: Output the name with the age, like `Juan (24)`
# * Level 3: Write code to automatically build a hash with the age as the key and
# an array of names as the value (all the people who are that age). e.g.
# `{24 => ['Juan', 'Steve', 'Jill']...}`

data = [
  ['Frank', 33],
  ['Stacy', 15],
  ['Juan', 24],
  ['Dom', 32],
  ['Steve', 24],
  ['Jill', 24]
]

sorted_data = data.sort do |person1, person2|
  person1[1] <=> person2[1]
end

# sorted_data.each do |person|
#   puts "#{person[0]} #{person[1]}"
# end

data_hash = sorted_data.each_with_object({}) do |curr, acc|
  acc[curr[1]] ? acc[curr[1]] << curr[0] : acc[curr[1]] = [curr[0]]
end

p data_hash
