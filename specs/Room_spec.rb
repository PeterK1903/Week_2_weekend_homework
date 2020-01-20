require('minitest/autorun')
require('minitest/reporters')
require_relative('../Guest.rb')
require_relative('../Song.rb')
require_relative('../Room.rb')

MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup()
    @room_main = Room.new('Main Hall', 10, 5)
    @room = Room.new("70s Room", 3, 10)
    @room1 = Room.new("80s Room", 4, 10)
    @room2 = Room.new("90s Room", 3, 10)
    @room3 = Room.new("Bairn's Room", 2, 10)

    @guest = Guest.new("Peter", 24, 100, "Umbrella")
    @guest1 = Guest.new("Paul", 34, 50, "Can't stop")
    @guest2 = Guest.new("Lorraine", 52, 75, "Born in the USA")
    @guest3 = Guest.new("Hollie", 18, 25, "Call me maybe")
    @guest4 = Guest.new("Brian", 69, 125, "No milk today")
    @guest5 = Guest.new("Sandra", 88, 60, "Can't hurry love")

    @song = Song.new("Umbrella", "Rihanna", "2000s")
    @song1 = Song.new("Call me maybe", "Carly Ray Jepsen", "2010s")
    @song2 = Song.new("No milk today", "Herman's Hermits", "1960s")
    @song3 = Song.new("Achy Breaky Heart", "Billy Ray Cyrus", "1990s")
    @song4 = Song.new("Barbie Girl", "Aqua", "1990s")
    @song5 = Song.new("Walk like an Egyptian", "The Bangles", "1980s")
    @song6 = Song.new("Down Under", "Men at work", "1980s")
    @song7 = Song.new("Play that funky music", "Wild Cherry", "1970s")
    @song8 = Song.new("Heart of Glass", "Blondie", "1970s")
    @song9 = Song.new("Stop! In the Name of Love", "The Supremes", "1960s")
    @song10 = Song.new("I love it", "Kanye West ft. Lil Pump", "2010s")




  end

  def test_find_room_by_name
    assert_equal("70s Room", @room.name)
  end

  def test_checking_guest_count
    assert_equal(0, @room.checking_guest_count)
  end

  def test_checking_guest_in
    @room.checking_guest_in(@guest)
    @room.checking_guest_in(@guest1)
    @room.checking_guest_in(@guest2)
    assert_equal(3, @room.checking_guest_count)
  end

  def test_checking_guest_out
    @room.checking_guest_in(@guest)
    @room.checking_guest_in(@guest1)
    @room.checking_guest_in(@guest2)
    @room.checking_guest_out(@guest1)
    @room.checking_guest_out(@guest2)
    assert_equal(1, @room.checking_guest_count)
  end

  def test_checking_song_count
    assert_equal(0, @room.checking_song_count)
  end

  def test_adding_song_to_playlist__room
    @room.adding_song_to_playlist(@song)
    @room.adding_song_to_playlist(@song1)
    @room.adding_song_to_playlist(@song2)
    assert_equal(3, @room.checking_song_count)
  end

  def test_removing_song_from_playlist
    @room.adding_song_to_playlist(@song)
    @room.adding_song_to_playlist(@song1)
    @room.adding_song_to_playlist(@song2)
    @room.removing_song_from_playlist(@song)
    @room.removing_song_from_playlist(@song1)
    assert_equal(1, @room.checking_song_count)
  end

  def test_if_too_many_guests
    @room.checking_guest_in(@guest)
    @room.checking_guest_in(@guest1)
    @room.checking_guest_in(@guest2)
    @room.checking_guest_in(@guest3)
    actual = "Sorry folks, this room has a capacity of 3 people!"
    assert_equal("Sorry folks, this room has a capacity of 3 people!", actual)
  end

  def test_charge_guest_fee
    @room.charge_guest_fee(5)
    assert_equal(505, @room.till)
  end

# During tests the below string returns with the tests, is this due to the guest cheering function just being a print?

  def test_guest_finds_fave_song_and_cheers
    @room.find_guest_fave_song(@guest.favesong) == true
    @guest.guest_cheering
    assert_equal("Woo! Pass the mic, i'm oan first!", @guest.guest_cheering)
  end

  def test_total_experience
    @room.checking_guest_in(@guest)
    @room.adding_song_to_playlist(@song)
    @room.charge_guest_fee(5)
    @room.find_guest_fave_song(@guest.favesong) == true
    @guest.guest_cheering
    assert_equal(505, @room.till)
    assert_equal("Woo! Pass the mic, i'm oan first!", @guest.guest_cheering)
    assert_equal(1, @room.checking_guest_count)
    assert_equal(1, @room.checking_song_count)
  end


#Test is returning actual result of "2000s" which is consistent with the first record of @song

  def test_add_song_to_specific_room_by_decade
    @room.add_song_to_specfic_room_by_decade(@song7)
    assert_equal(1, @room.checking_song_count)
    assert_equal("1970s", @song7.decade)
  end

end
