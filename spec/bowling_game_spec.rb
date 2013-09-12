require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling_game.rb'


describe BowlingGame do
  describe '.initialize' do # this all happens within the initialize class method
    it 'sets @rolls to an empty array' do
      game = BowlingGame.new

      expect(game.rolls).to eq([]) 
    end
  end

  #---------------- SCORE METHOD TESTS ---------------------------------#

  describe "#score" do # this happens within the score instance method. 
  	it 'scores the game as 0 when only gutter balls are thrown' do
  		game = BowlingGame.new
  		20.times { game.roll(0) }

  		expect(game.score).to eq(0)
  	end


  	#creating a new expectation when one pin is knocked down vs. gutter ball (0 pins)
  	it 'scores the game as 20 when one pin is knocked down on each roll' do
  		game = BowlingGame.new
  		20.times { game.roll(1) }

  		expect(game.score).to eq(20)
  	end

  	
  end  #ending the score method tests

  #---------------- ROLL METHOD TESTS ---------------------------------#





end  #describe bowling game close







# bundle exec rspec spec/bowling_game_spec.rb