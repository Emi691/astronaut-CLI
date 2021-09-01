class API

    @@url = 'http://api.open-notify.org/astros.json'

    def self.get_astros
        response = HTTParty.get(@@url)
        binding.pry
    end

end