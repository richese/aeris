class CKohonenNN

	def initialize(vector_size, neurons_count, phi = 0.1)

		phi = 0.01
		@neurons = Array.new(neurons_count) { Array.new(vector_size) }

		@output0 = Array.new(neurons_count) {0.0}
		@input = Array.new(vector_size) {0.0}

		for j in 0..@neurons.size-1
			
			for i in 0..@neurons[j].size-1
				@neurons[j][i] = rnd()
			end

		end

		@phi = phi
		@result = 0
	end


	def process(input)

		for i in 1..@input.size-1
			@input[@input.size-1-i] = @input[@input.size-2-i]
		end

		@input[0] = input

		@result = 0 
		@dist_min = @input.size()*100.0

		for j in 0..@neurons.size-1
			
			tmp = 0.0
			for i in 0..@neurons[j].size-1
				tmp+= (@neurons[j][i] - @input[i]).abs
			end

			if (tmp < @dist_min)
				@dist_min = tmp
				@result = j
			end

		end

		#self learning
		for j in 0..@neurons.size-1

			if (j == @result)
				phi = @phi
			else
				phi = @phi*0.001
			end

			for i in 0..@neurons[j].size-1
				@neurons[j][i] = (1.0 - phi)*@neurons[j][i] + phi*@input[i]
			end
		end


		return @result
	end

	def get
		return @output0[@result]
	end

	def learn(error, phi = 0.05)
		@output0[@result] = @output0[@result] + phi*error
	end
	

	def rnd()
		return (rand() - 0.5)*2.0
	end

end