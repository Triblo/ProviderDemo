class ProvidersController < ApplicationController
    def index
        @providers = Provider.all
        @provider = Provider.new

      end
    
      def create
        require 'json'
        require 'open-uri'
    
        npi = strong_params[:npi]
    
        url = "https://npiregistry.cms.hhs.gov/api/?version=2.0&number=#{npi}"
        doc = JSON.parse(URI.open(url).read)['results'][0]
    
        @provider = Provider.new(
          @npi = doc['basic']['npi'],
          @name = doc['basic']['name'],
          @address = doc['basic']['addresses'][0]['address_1'],
          @city = doc['basic']['addresses'][0]['city'],
          @state = doc['basic']['addresses'][0]['state'],
          @zip = doc['basic']['addresses'][0]['postal_code'],
          @type = doc['basic']['enumeration_type'],
          @code = doc['basic']['taxonomies']['code'],
          @license = doc['basic']['taxonomies']['license']
        )
    
        @provider.save
      end
    
      private
    
      def strong_params
        params.required(:provider).permit(:npi)
      end    
end
