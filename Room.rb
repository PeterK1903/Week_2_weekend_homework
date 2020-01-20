class Room
  require('pry')

  attr_accessor :name, :capacity, :till, :fee

  def initialize(name, capacity, fee)

    @name = name
    @capacity = capacity
    @till = 500
    @fee = fee
    @playlist = []
    @guest = []



  end

  def checking_guest_count
    return @guest.length()
  end

  def checking_guest_in(guest)
    @guest.push(guest)
  end

  def checking_guest_out(guest)
    @guest.delete(guest)
  end

  def checking_song_count
    return @playlist.length()
  end

  def adding_song_to_playlist(song)
    @playlist.push(song)
  end

  def too_many_guests(guests)
    if @guests.count > @capacity
      return
      "Sorry folks, this room has a capacity of #{@capacity} people!"
    end
  end

  def removing_song_from_playlist(song)
    @playlist.delete(song)
  end

  def charge_guest_fee(fee)
    @till += fee
  end

  def find_guest_fave_song(song)
    if @playlist.include?(song)
      return true
    else
      return false
    end
  end

# Is the below function actually doing anything or is the test passing with what is being called already in the spec file?

  def total_experience(guest, song, fee)
    checking_guest_in(guest)
    adding_song_to_playlist(song)
    charge_guest_fee(fee)
    find_guest_fave_song(song)
    guest_cheering
  end


# Atemmpt at adding by decade to allow further function
# that would take a party of guests, give median age and suggest a room based on songs by decade.

  def add_song_to_specfic_room_by_decade(song)
    song.find_song_by_decade
    if song.decade == "1970s"
      # binding.pry
    adding_song_to_playlist(song)
    end
  end



  end
