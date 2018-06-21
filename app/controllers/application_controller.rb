require 'rest-client'
require 'json'
require 'net/http'
require 'open-uri'
require 'byebug'

class ApplicationController < ActionController::API
    def makeFetchHappen(query)
        
        search = query.gsub(' ','%20')
        
        yummlyURL = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['API_ID']}&_app_key=#{ENV['API_KEY']}&requirePictures=true&q=#{search}"
        que = ""
        query.split(' ').each{|item| que = que+"&allowedIngredient[]=#{item}"}
        finalURL = yummlyURL + que

        link = URI.parse(finalURL)
        response = Net::HTTP.get_response(link)
        response.body
        result = JSON.parse(response.body)
        
        return result
    end
end