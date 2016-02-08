require "./log.rb"
require "./curve.rb"

input_log = CLog.new("bin/input_points.txt", 2)
log = CLog.new("bin/result.txt", 5)

curve = CCurve.new(2)

iterations = 1000

density = 10


x_required = Array.new()
y_required = Array.new()


for t in 0..iterations-1
	x = 0.1*t;
	y = Math.sin(x*0.2) + Math.cos(x*0.7) + Math.cos(x*0.41)

	if t > iterations*0.6
	#	y = 1.0
	end

	x_required[t] = x
	y_required[t] = y

	log.add(0, x)
	log.add(1, y) 
end

error_sum = 0.0
error_max = 0.0
error_cnt = 0


for t in 0..iterations-1

	x = 0.1*t

	y_interpolated = curve.process(x);

	if (t%density) == 0 && (t+density < iterations)

		curve.calculate(x_required[t+density], y_required[t+density])

		input_log.add(0, x_required[t])
		input_log.add(1, y_required[t])

	end

	error = 0.0

	if (t > 0.1*iterations) && (t < 0.9*iterations)

		error = y_required[t] - y_interpolated

		error_sum+= error.abs()

		if error.abs > error_max
			error_max = error.abs()
		end

		error_cnt+=1
	end


	
	log.add(2, x)	
	log.add(3, y_interpolated)
	log.add(4, error)
end

log.save()
input_log.save()


printf("average error %f\n", error_sum/error_cnt)
printf("maximal error %f\n", error_max)