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
        Astronaut.all.each{|astro| puts "#{astro.name}, #{astro.craft}"}
        input = gets.strip
        self.back_or_exit(input)
    end

    def craft
        puts 'All craft:'
        Astronaut.all_craft.each {|craft| puts "#{craft}"}
        puts 'type the name of a craft to see Astronauts on board'
        puts "type in 'location' to see the current location of the ISS"
        input = gets.strip
        self.astros_by_craft(input)
    end

    def iss_loc
        API.get_iss
        puts 'Current location of the ISS:'
        puts "longitude #{ISS.newest.longitude}"
        puts "latitude: #{ISS.newest.latitude}"
        input = gets.strip
        self.back_or_exit(input)
    end

    def astros_by_craft(input)
        if Astronaut.all_craft.include?(input)
            Astronaut.find_by_craft(input).each{|astro| puts "#{astro.name}, #{astro.craft}"}
            input = gets.strip
            self.back_or_exit(input)
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

    def exit
        abort('Thanks for using Astros!')
    end
end