require 'net/http'
require 'uri'
require 'json'


class PagesController < ApplicationController
  def home
    @all_dentists = fetch_data()
    @business_profile = @all_dentists["business_profile"]

  end

  def about

  end


  def fetch_data
    uri = URI.parse("https://dctt.org.tt/index.php?r=site/members")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      @data = JSON.parse(response.body)
    else
      @error = response.message
    end

    # Render or process the data as needed
  end
end
