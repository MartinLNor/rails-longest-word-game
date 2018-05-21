require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letter = []
    10.times do |i|
    @letter << ('A'..'Z').to_a.sample
    end
  end

  def score

    url = 'https://wagon-dictionary.herokuapp.com/'
    @word= params[:word]
    @array = params[:array_token]
    word_serialized = open(url+@word).read
    wording = JSON.parse(word_serialized)
    @test = wording['found']
    if @test
      @word.split().each do |letter|
        if @array.count(letter) == @word.count(letter)
          @message = "You win with a #{@word.length} word size ! Good job !"
          @image = "winner.png"
        else
          @message = 'Your word is not include in the letter proposition'
          @image = "what.png"
        end
      end
    else
       @message = "You loose it's not an english word"
       @image = "looser.jpeg"
    end
  end


end

=begin
https://wagon-dictionary.herokuapp.com/frost
=end



