class ISS
    attr_accessor :longitude, :latitude

    @@all = []

    def initialize(hash)
        hash.each {|key, value| self.send("#{key}=", value)}
    end

    def self.all
        @@all
    end

    def self.newest
        self.all.last
    end
end