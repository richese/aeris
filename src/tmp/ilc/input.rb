class CInput

	def intialize()

		reset()
	end

	def reset()
		@y0 = 0.0
	end


	def get(n, maneveur_id = 1)

		x = n/10.0
		k = Math.log(maneveur_id*0.9 + 1.0)
		
		#@y0 = @y0 + 0.1*( 0.03 + Math.sin(2.1*x + Math.sin(0.1*x - 0.123)) + Math.sin(x*0.321 + 0.234))
		@y0 = 2.0**(x*0.1*k) - 1.0

		return @y0
	end

end