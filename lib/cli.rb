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
    end

end