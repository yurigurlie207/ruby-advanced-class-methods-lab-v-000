class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name="newName",artist_name="newArtist")
    song = self.new
    song.name = name
    song.artist_name = artist_name

    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name

    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name

    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{ |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    uniqueArray = self.all.sort_by { |songObj| songObj.name }
    uniqueArray.uniq
  end

  def self.new_from_filename(name)
    songName = name.split("-")[1].split(".")[0].strip
    self.create_by_name(songName)
    self.artist_name = name.split("-")[0].strip
  end




end
