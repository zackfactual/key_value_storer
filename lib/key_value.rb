# a tool for storing and fetching key-value pairs

# CLASSES

# override Hash class
class Hash
  # put takes key and value, outputs "ok" on success
  def put(new_key, new_value)
    self[new_key] = new_value
    "ok"
  end

  # go_fetch takes key, outputs value on success, "value not found" on failure
  def go_fetch(target_key)
    if self.key?(target_key)
        self[target_key]
    else
        "value not found"
    end
  end
end

# FUNCTIONS

# help function
def help
  "To add a key-value pair to your Hash, please enter 'put your_key your_value'\n"\
  "NOTE: you may not include spaces in your key or value names\n"\
  "To fetch a value from your Hash, please enter 'fetch your_key'\n"\
  "To exit the program, please enter 'exit'\n"\
  "To see these instructions again, please enter 'help'"
end

# get user input function
def get_input
  gets.chomp.split(" ")
end

# process user input function
def process_input(user_input)
  if user_input[0] == "put" && user_input.length != 3
    "Invalid input. Your key and value names must not contain spaces"
  elsif user_input[0] == "put" && user_input.length == 3
    $key_value.put(user_input[1], user_input[2])
  elsif user_input[0] == "fetch" && user_input.length == 2
    $key_value.go_fetch(user_input[1])
  elsif user_input[0] == "help" && user_input.length == 1
    help
  elsif user_input[0] == "exit" && user_input.length == 1
    puts "Bye!"
    exit(0)
  else
    "Unknown command. Known commands are: put, fetch, exit"
  end
end

# PROGRAM FLOW

# set up for user or test session
$key_value = Hash.new
user_input = ""

# begin interactive session
if __FILE__ == $0
  puts "Welcome to the key-value sorting and fetching tool!"
  puts help
  # read and process user input
  while user_input != "exit"
    print "> "
    user_input = get_input
    puts process_input(user_input)
  end
end