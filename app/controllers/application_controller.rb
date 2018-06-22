require 'rest-client'
require 'json'
require 'net/http'
require 'open-uri'
require 'byebug'

class ApplicationController < ActionController::API
### AUTH START
    
    def getSecret
        ENV['JWT_SECRET']
    end

    def getToken
        request.headers["Authorization"]
    end

    def getDecodedToken()
        begin
          decoded_token = JWT.decode getToken(), getSecret(), true, { algorithm: 'HS256' }
        rescue JWT::DecodeError
          return nil
        end
        decoded_token
    end
      
    def isAuthenticated?
        !!getDecodedToken()
    end

    def loginRequired
        if !isAuthenticated?()
            render json: {
              message: "User not authorized"
            }, status: :unauthorized
        end
    end

    def userMatch
        @user = User.find(params[:user_id])
        if @user.id != getDecodedToken()[0]["id"]
            render json: {
                message: "User not authorized"
            }, status: :unauthorized
        end
    end

### AUTH END

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