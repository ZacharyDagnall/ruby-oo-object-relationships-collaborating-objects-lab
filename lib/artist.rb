class Artist
    attr_accessor :name
    @@all = []

    def initialize(name=nil)
        @name = name
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist==self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

    def self.find_or_create_by_name(name)
        this_artist = self.all.find{|artist| artist.name==name}
        return this_artist unless !this_artist
        Artist.new(name)
    end

end
