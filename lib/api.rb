class API
    def self.get_astros
        url = 'http://api.open-notify.org/astros.json'
        response = HTTParty.get(url)
        response["people"].each do |astro|
            Astronaut.new(astro)
        end
    end

    def self.get_iss
        url = 'http://api.open-notify.org/iss-now.json'
        response = HTTParty.get(url)
        loc = response["iss_position"]
        ISS.new(loc)
    end
end