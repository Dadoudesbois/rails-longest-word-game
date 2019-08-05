class GamesController < ApplicationController
  def new
    alphabet = Array('A'..'Z')
    @letters = Array.new(10) { alphabet.sample }
    @letters
  end

  def english_word?
    response = open("https://wagon-dictionary.herokuapp.com/#{params[:word].downcase}")
    json = JSON.parse(response.read)
    @english_word = json[:found]
    @english_word
  end

  def valid_grid?
    @valid_grid = params[:word].chars.all? { |letter| params[:word].upcase.count(letter) <= @letters.count(letter) }
    @valid_grid
  end

  def score
  end
end
