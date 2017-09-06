require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    artist_title = file_name.split(" - ")
    new_song = self.new
    new_song.name = artist_title[1].split(".")[0]
    new_song.artist_name = artist_title[0]
    new_song
  end

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end


end
