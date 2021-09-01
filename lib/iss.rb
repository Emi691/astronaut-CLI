class ISS
    attr_accessor :longitude, :latitude

    @@all = []

    def initialize(hash)
        hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self
    end
end