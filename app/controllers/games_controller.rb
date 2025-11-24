require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = Array.new(10){('A'..'Z').to_a.sample}
  end

  def score
    @input = params[:input].upcase
    @letters = params[:letters]
    url = "https://dictionary.lewagon.com/#{@input}"
    user_serialized = URI.parse(url).read
    user = JSON.parse(user_serialized)
    @validletters = @input.chars.all? { |letter| @letters.include?(letter) }
    @validword = user["found"]
  end

end
