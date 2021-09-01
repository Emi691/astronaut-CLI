class CLI 

    def hello
        puts 'Welcome to Astro CLI'
        self.menu
    end

    def menu
        puts 'please choose an option'
        @input = gets.strip
    end

end