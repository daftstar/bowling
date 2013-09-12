require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling_game.rb'


describe BowlingGame do
	let(:game) {BowlingGame.new} #this automatically creates a new bowling game 
																 #for each test within class BowlingGame

  describe '.initialize' do # this all happens within the initialize class method
    it 'sets @rolls to an empty array' do
      expect(game.rolls).to eq([]) 
    end
  end

  #---------------- SCORE METHOD TESTS ---------------------------------#

  describe "#score" do # this happens within the score instance method. 
  	
  	context 'when only guter balls are thrown' do
  		it 'scores the game as 0' do
  			20.times { game.roll(0)}

  			expect(game.score).to eq(0)
  		end 
  	end

  	context 'when one pin is knocked down on each roll' do
  		it 'scores the game as 20' do
  			20.times { game.roll(1) }

  			expect(game.score).to eq(20)
  		end
  	end

  	context 'when a spare is thrown' do
  		it 'records frame score as 10 plus number of pins knocked down in the next frame' do
  			3.times  { game.roll(5) }
  			17.times { game.roll(0) }

  			expect(game.score).to eq(20)
  		end
  	end

  	context 'when a strike is thrown' do
  		it 'records frame score as 10 plus total num pins knocked down in next two rolls' do
  			game.roll(10)
  			game.roll(7)
  			game.roll(1)
				16.times { game.roll(0) }

				expect(game.score).to eq(26)
  		end
  	end



  	
  	#using context instead
  	#it 'scores the game as 0 when only gutter balls are thrown' do 
  	# 	20.times { game.roll(0) }

  	# 	expect(game.score).to eq(0)
  	# end


  	# #creating a new expectation when one pin is knocked down vs. gutter ball (0 pins)
  	# it 'scores the game as 20 when one pin is knocked down on each roll' do
  	# 	20.times { game.roll(1) }

  	# 	expect(game.score).to eq(1)
  	# end


  end  #ending the score method tests

  #---------------- ROLL METHOD TESTS ---------------------------------#





end  #describe bowling game close







# bundle exec rspec spec/bowling_game_spec.rb