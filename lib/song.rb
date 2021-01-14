require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name=nil,artist=nil)
        @name = name
        @artist = artist
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.new_by_filename(filename)
        info = filename.split(" - ")
        this_name = info[1]
        this_artist = Artist.find_or_create_by_name(info[0])
        self.new(this_name,this_artist)
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end


end
