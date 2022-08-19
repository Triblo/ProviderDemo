class Provider
    def initialize(npi)
        @npi = npi
    end
    
    def get_response
        HTTPparty.get('https://npiregistry.cms.hhs.gov/api/?version=2.0&number=' + @npi)
    end
end
