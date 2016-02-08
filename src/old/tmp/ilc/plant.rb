class CPlant

	def initialize()

		reset()
	end


	def reset()

		#servo
		#@b = 0.1
		#@a1 = 1.0 + 0.4
		#@a2 = 0.0 - 0.4
		#@a3 = 0.0

		#1st order
		#@b = 0.1
		#@a1 = 0.98
		#@a2 = 0.0
		#@a3 = 0.0

		#2nd order
		#@b = 0.1
		#@a1 = 0.5
		#@a2 = 0.4
		#@a3 = 0.0

		#3rd order
		#@b = 0.1
		#@a1 = 0.5
		#@a2 = 0.4
		#@a3 = 0.3


		#oscilating
		r = 0.8
		omega = 0.08*(2.0*Math::PI)
		@b = 0.3
		@a1 = 2.0*r*Math.cos(omega)
		@a2 = -r*r
		@a3 = 0.0

		
		@y0 = 0.0
		@y1 = 0.0
		@y2 = 0.0
		@y3 = 0.0
	end

	def get(input)

		@y3 = @y2
		@y2 = @y1
		@y1 = @y0
		@y0 = @y1*@a1 + @y2*@a2 +@y3*@a3 + input*@b

		if @y0 > 100.0
			@y0 = 100.0
		end

		if @y0 < -100.0
			@y0 = -100.0
		end

		return @y0
	end

end
