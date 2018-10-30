require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...9).map { rand(65..90).chr }
  end

  def score
    @answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    @answers = JSON.parse(open(url).read)
    if @answers['found'] == false
      @result = 'not a word my hard rocking amigo'
    elsif @answers['found'] == true
      @result = 'Yeah u soo smart, xuxu'
    end
  end
end
