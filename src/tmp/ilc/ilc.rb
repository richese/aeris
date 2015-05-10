class CILC

	def initialize(u_size, u_count = 1)

		@u = Array.new(u_count) { Array.new(u_size) {0.0} }
		@err0 = Array.new(u_count) { Array.new(u_size) {0.0} }
		@err1 = Array.new(u_count) { Array.new(u_size) {0.0} }

		for j in 0..u_count-1
			for i in 0..u_size-1

				@u[j][i] = 0.0
				@err0[j][i] = 0.0
				@err1[j][i] = 0.0
			end
		end

		@ptr = 0
		@maneveur_idx = 0

		@limit = 2.0
	end

	def reset(phi = 0.5, gamma = 0.5)
		for i in 0..@u[@maneveur_idx].size-2
			

					dif = @u[@maneveur_idx][i] +
					phi*@err0[@maneveur_idx][i+1] + 
					gamma*(@err0[@maneveur_idx][i+1] - @err1[@maneveur_idx][i+1])

		if (dif > @limit)
			dif = @limit
		end

		if (dif < -@limit)
			dif = -@limit
		end


			@u[@maneveur_idx][i] = dif
		end
		@ptr = 0
		@res = 0.0
	end

	def get(error, maneveur_idx = 0)

		@maneveur_idx = maneveur_idx

		@res = 0.0

		if (@ptr < @u[@maneveur_idx].size)
		
			@err1[@maneveur_idx][@ptr] = @err0[@maneveur_idx][@ptr]
			@err0[@maneveur_idx][@ptr] = error
			@res = @u[@maneveur_idx][@ptr]			
			
			@ptr = @ptr + 1
			
		end


		return @res
	end

end