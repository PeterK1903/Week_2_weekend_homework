class Song

  attr_accessor :title, :artist, :decade

  def initialize(title, artist, decade)
    @title = title
    @artist = artist
    @decade = decade

  end

def find_song_by_decade
  return @decade
end

end
