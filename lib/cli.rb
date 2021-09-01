class CLI 
    def hello
        puts 'Welcome to Astro CLI'
        API.get_astros
        self.menu
    end

    def menu
        puts 'Please choose an option'
        puts '1. all astronauts'
        puts '2. all spacecraft'
        puts '3. current location of the ISS'
        input = gets.strip
        self.directory(input)
    end

    def directory(input)
        if input == 1
            self.astros
        elsif input == 2
            self.craft
        elsif input == 3
            self.iss_loc
        elsif input == exit
            self.exit
        else
            puts 'Option not found'
            self.menu
        end
    end

    def astros
        puts 'All Astronauts:'
        puts Astronaut.all
        input = gets.strip
    end

    def craft
        puts Astronaut.all_craft
    end

    def iss_loc
        puts 'Current location of the ISS:'
        API.get_iss
        puts ISS.newest
        input = gets.strip
    end

    def self.exit
        abort('Thanks for using Astros!')
    end
end