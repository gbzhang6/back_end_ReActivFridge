require 'rest-client'
require 'json'
require 'net/http'
require 'open-uri'
require 'byebug'

class ApplicationController < ActionController::API
    def makeFetchHappen(query)
        
        yummlyURL = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['API_ID']}&_app_key=#{ENV['API_KEY']}&requirePictures=true&q=#{query}"
        que = ""
        query.split('%20').each{|item| que = que+"&allowedIngredient[]=#{item}"}
        finalURL = yummlyURL + que

        # debugger

        link = URI.parse(finalURL)
        response = Net::HTTP.get_response(link)
        response.body
        result = JSON.parse(response.body)
        # debugger
        # result["matches"].sort_by{|h| h["rating"]}.reverse
        
        return result
    end
end