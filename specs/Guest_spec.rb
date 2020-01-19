require('minitest/autorun')
require('minitest/reporters')
require_relative('../Guest.rb')
require_relative('../Song.rb')
require_relative('../Room.rb')

MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new

class GuestTest < MiniTest::Test

  def setup()

    @guest = Guest.new("Peter", 24, 100, "Umbrella")
    @guest1 = Guest.new("Paul", 34, 50, "Can't stop")
    @guest2 = Guest.new("Lorraine", 52, 75, "Born in the USA")
    @guest3 = Guest.new("Hollie", 18, 25, "Call me maybe")
    @guest4 = Guest.new("Brian", 69, 125, "No milk today")
    @guest5 = Guest.new("Sandra", 88, 60, "Can't hurry love")

    @room = Room.new("70s Room", 3, 10)

  end

  def test_find_guest_by_name
    assert_equal("Peter", @guest.name)
  end

  def test_guest_paying_fee
    @guest.guest_paying_fee(@room.fee)
    assert_equal(90, @guest.cash)
  end

  def test_guest_cheering
    actual = @guest.guest_cheering
    assert_equal("Woo! Pass the mic, i'm oan first!", actual)
  end

end
