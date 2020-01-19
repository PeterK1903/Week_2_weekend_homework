require('minitest/autorun')
require('minitest/reporters')
require_relative('../Guest.rb')
require_relative('../Song.rb')
require_relative('../Room.rb')

MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new


class SongTest < MiniTest::Test

  def setup()

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

  def test_find_song_by_title
    assert_equal("Umbrella", @song.title)
  end

  def test_find_song_by_artist
    assert_equal("Rihanna", @song.artist)
  end

  def test_find_song_by_decade
    assert_equal("2000s", @song.decade)
  end

end
