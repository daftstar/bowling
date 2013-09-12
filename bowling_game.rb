class BowlingGame
attr_accessor :rolls 

	def initialize
		@rolls = []
		@total_score = 0
		@current_roll = 0
	end


	# Records a roll in the game. 
	#
	# pins - the integer number of pins knocked down in this roll. 
	#
	# returns nothing. 
	def roll(pins)
		@rolls.push(pins)
	end


	# Returns the integer score for this game.  Expects to be run aftaer all rolls
	# for the game have been recorded. 
	def score
		while @current_roll < @rolls.size - 1
			init_roll

			if strike?
				score_strike

			elsif spare?
				score_spare

			else normal_roll?
				score_normal

			end
		end

		return @total_score
	end

	private

	# Initialize values for roll and next_roll
	#
	# returns nothing.

	def init_roll
		@roll 			= @rolls[@current_roll]
		@next_roll	= @rolls[@current_roll + 1]
	end

	# Returns true if the current roll is a strike, false otherwise. 
	def strike? 
		@roll == 10
	end

	# returns true if the roll plus the next roll is a spare (false otherwise)
	def spare?
		@roll + @next_roll == 10
	end
	
	# this is executed if the the strike and spare methods are not called. 
	def normal_roll?
	end




	# Scores a strike frame, and adds it to the total score for the game. 
	#
	# returns nothing

	def score_strike
		@total_score += 10 + @next_roll + @rolls[@current_roll + 2]
		@current_roll += 1
	end


	# a spare is defined as bowling 10 pins within 2 rolls (1 frame)
	# if a spare is rolled, 10 is added to the total score plus 
	# the sum of the next two rolls (in reality, 10 is added to the score 
	# of the first roll in the next frame). Anyways, after the scoring is done,
  # the # of rolls counter is incremented by 2 to indicate move to the next frame. 
  # (each frame = 2 rolls)
	def score_spare
    @total_score += 10 + @rolls[@current_roll + 2]
    @current_roll += 2	
	end


	# keeps score of a non-strike and non-spare type frame.  This is simply
	# anytime a user does not knock down all 10 pins. 
	def score_normal
		@total_score += @roll + @next_roll
		@current_roll +=2
	end




end # ends the entire block of code from Class BowlingGame
