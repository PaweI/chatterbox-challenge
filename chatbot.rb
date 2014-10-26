def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
              'How are you' => 'I am very good, thank you!',
              'Did you try (.*)' => 'Yes, I like %{c1}',
              'Who is your creator?' => 'Internet wisdom',
              'Have you seen movie (.*)' => 'Oh, %{c1}. I watched it today. Could be better',
              'Which OS better (.*) or (.*)' => 'Of course %{c1}! But %{c2} have some advantages too :-)'}


puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"
while(input = gets.chomp) do
  puts get_response(input)
end