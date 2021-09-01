class Astronaut
    attr_accessor :name, :craft

    @@all = []

    def initialize(hash)
        hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self
    end

    def self.all
        @@all
    end

    def self.all_craft
        self.all.map{|astro| astro.craft}.uniq
    end

    def self.find_by_craft(craft)
        self.all.find_all{|astro| astro.craft == craft}
    end
end