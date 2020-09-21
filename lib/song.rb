class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create 
    song = Song.new
    @@all.push(song)
    song
    
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    @@all.push(song)
    song
  end

  def self.find_by_name(name)
    Song.all.find { | element|
     name == element.name 
      }
  end

  def self.find_or_create_by_name(name)
    songObj = find_by_name(name)
    if(songObj)
      songObj
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort { |objA, objB| objA.name <=> objB.name }
  end

  def self.new_from_filename(name)
    nameTuple = name.split("-")
    song = Song.new
    song.artist_name= nameTuple[0].strip
    song.name = nameTuple[1].split('.')[0].strip
    song
  end

  def self.create_from_filename(name)
    song = new_from_filename(name)
    @@all.push(song)
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
