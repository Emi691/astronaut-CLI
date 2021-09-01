class API

    @@url = 'http://api.open-notify.org/astros.json'

    def self.get_astros
        response = HTTParty.get(@@url)
        response["people"].each do |astro|
            Astronaut.new(astro)
        end
    end

end