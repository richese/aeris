class CInput

	def intialize()

		reset()
	end

	def reset()
		@y0 = 0.0
	end


	def get(n, maneveur_id = 1)

		@y0 = 0.0
		#x = n/10.0
		#k = Math.log(maneveur_id*0.9 + 1.0)
		#@y0 = 2.0**(x*0.1*k) - 1.0

		period = 30*Math.log(maneveur_id*0.1 + 2.0)
		if ((n%period) > period/2)
			@y0 = 1.0
		else
			@y0 = 0.0
		end

		return @y0
	end

end