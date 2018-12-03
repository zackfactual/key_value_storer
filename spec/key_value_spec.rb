require './lib/key_value.rb'

RSpec.describe do
  # put functionality tests
  describe "check length of hash after one input" do
    it "should equal one" do
      $key_value.clear
      $key_value.put("favorite_flavor", "chocolate")
      expect($key_value.length).to eq(1)
    end
  end

  describe "check length of hash after inputting same sole entry twice" do
    it "should still equal one" do
      $key_value.clear
      $key_value.put("favorite_color", "green")
      $key_value.put("favorite_color", "green")
      expect($key_value.length).to eq(1)
    end
  end

  describe "check that you can add multiple entries to hash" do
    it "should equal number of entries added" do
      $key_value.clear
      $key_value.put("favorite_season", "summer")
      $key_value.put("favorite_bird", "hummingbird")
      expect($key_value.length).to eq(2)
    end
  end

  describe "check that put can change the value of a given key" do
    it "should change from cat to dog" do
      $key_value.clear
      $key_value.put("favorite_pet", "cat")
      $key_value.put("favorite_pet", "dog")
      expect($key_value["favorite_pet"]).to eq("dog")
    end
  end

  # go_fetch functionality test
  describe "check that go_fetch gets what you expect it to get" do
    it "should get the value for the key provided" do
      $key_value.clear
      $key_value.put("favorite_author", "ursula_k_leguin")
      expect($key_value.go_fetch("favorite_author")).to eq("ursula_k_leguin")
    end
  end

  # error tests
  describe "check that correct error displays when put command is wrong length" do
    it "should say 'Invalid input. Your key and value names must not contain spaces'" do
      $key_value.clear
      user_input = ["put", "favorite_dessert", "pumpkin", "pie"]
      expect(process_input(user_input)).to eq("Invalid input. Your key and value names must not contain spaces")
    end
  end

  describe "check that correct error displays when fetch function can't find key in hash" do
    it "should say 'value not found'" do
      $key_value.clear
      expect($key_value.go_fetch("favorite_book")).to eq("value not found")
    end
  end

  describe "check that correct error displays when user_input is invalid command" do
    it "should say 'Unknown command. Known commands are: put, fetch, exit'" do
      $key_value.clear
      user_input = "Fool of a Took!"
      expect(process_input(user_input)).to eq("Unknown command. Known commands are: put, fetch, exit")
    end
  end
end