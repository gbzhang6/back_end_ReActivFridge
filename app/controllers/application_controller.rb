require 'rest-client'
require 'json'
require 'net/http'
require 'open-uri'

class ApplicationController < ActionController::API
    def makeFetchHappen(query)
        
        yummlyURL = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['API_ID']}&_app_key=#{ENV['API_KEY']}&requirePictures=true&q=#{query}"
        q = ""
        query.split('%20').each{|item| q = q+`&allowedIngredient[]=#{item}`}
        finalURL = yummlyURL + q

        link = URI.parse(finalURL)
        response = Net::HTTP.get_response(link)
        response.body
        result = JSON.parse(response.body)
        return result
    end
end