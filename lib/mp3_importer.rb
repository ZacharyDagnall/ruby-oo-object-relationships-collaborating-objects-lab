

class MP3Importer
    attr_accessor :path


    def initialize(filepath)
        @path = filepath
        @files = []
    end

    def files
        files = Dir[path+"/*.mp3"]
        files = (files.map{|filename| filename.split(/[\/]/) }).map{|file| file[-1]}
        files
    end

    def import
        self.files.each{|file| Song.new_by_filename(file)}
    end




end