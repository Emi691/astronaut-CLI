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
        if input == '1'
            self.astros
        elsif input == '2'
            self.craft
        elsif input == '3'
            self.iss_loc
        elsif input == 'exit'
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
        self.back_or_exit(input)
    end

    def craft
        puts 'All craft:'
        puts Astronaut.all_craft
        puts 'type the name of a craft to see Astronauts on board'
        puts "type in 'location' to see the current location of the ISS"
        input = gets.strip
        self.atros_by_craft(input)
    end

    def iss_loc
        puts 'Current location of the ISS:'
        API.get_iss
        puts "latitude #{ISS.newest.longitude}"
        puts "latitude: #{ISS.newest.latitude}"
        input = gets.strip
        self.back_or_exit(input)
    end

    def atros_by_craft(input)
        if Astronaut.all_craft.include?(input)
            Astronaut.find_by_craft(input)
        elsif input == 'location'
            self.iss_loc
        elsif input == 'back'
            self.craft
        elsif input == 'exit'
            self.exit
        else
            puts 'Option not found'
            input = gets.strip
            back_or_exit(input)
        end
    end

    def back_or_exit(input)
        if input == 'back'
            self.menu
        elsif input == 'exit'
            self.exit
        else
            puts 'Option not found'
            input = gets.strip
            back_or_exit(input)
        end
    end

    def self.exit
        abort('Thanks for using Astros!')
    end
end