class CCurve


	def initialize(mode = 0)
		@mode = mode

		@a = 0.0
		@b = 0.0
		@c = 0.0

		@points = Array.new(3) { Array.new(2) }

		for j in 0..@points.size-1
			for i in 0..@points[j].size-1
				@points[j][i] = 0.0
			end
		end

		@x0 = 0.0
		@y0 = 0.0

		@x1 = 0.0
		@y1 = 0.0

		@x2 = 0.0
		@y2 = 0.0

		@cx = 0.0
		@cy = 0.0
		@cr = 0.0

	end


	def calculate(x0, y0)

		@x2 = @x1
		@y2 = @y1

		@x1 = @x0
		@y1 = @y0

		@x0 = x0
		@y0 = y0

		
		if (@mode == 0)
			@a = 0.0
			@b = 0.0
			@c = @y0
		end

		if (@mode == 1)
			tmp = @x0 - @x1
			@a = 0.0

			if tmp != 0.0
				@b = (@y0 - @y1) / tmp
			end

			@c = @y0 - @b*@x0
		end

		if (@mode == 2)

			denom = (@x0 - @x2)*(@x0 - @x1)*(@x1 - @x2)

			if (denom == 0.0)
				return
			end

			@a = (@x2 * (@y1 - @y0) + @x1 * (@y0 - @y2) + @x0 * (@y2 - @y1)) / denom
			@b = ( (@x2**2) * (@y0 - @y1) + (@x1**2) * (@y2 - @y0) + (@x0**2) * (@y1 - @y2)) / denom
			@c = (@x1 * @x2 * (@x1 - @x2) * @y0 + @x2 * @x0 * (@x2 - @x0) * @y1 + @x0 * @x1 * (@x0 - @x1) * @y2) / denom
		
		end

	end


	def process(x)		
		y = (@a*x*x) + (@b*x) + @c
		return y
	end


end