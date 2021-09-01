class CLI 

    def hello
        puts 'Welcome to Astro CLI'
        self.menu
    end

    def menu
        puts 'Please choose an option'
        puts '1. all astronauts'
        puts '2. all spacecraft'
        puts '3. astronauts by country'
        puts '4. spacecraft by country'
        API.get_astros
        # input = gets.strip
    end

end