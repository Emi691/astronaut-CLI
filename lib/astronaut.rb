class Astronaut
    attr_accessor :name, :craft

    def initialize(hash)
        hash.each {|key, value| self.send("#{key}=", value)}
        binding.pry
    end
end