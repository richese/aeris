require "./log.rb"
require "./curve.rb"

require "./map_smooth.rb"

map_log = CLog.new("bin/map.txt", 2)
input_points_log = CLog.new("bin/input_points.txt", 2)

curve = CCurve.new(0)

iterations = 200

density = 30

dimensions = 2

map = Array.new(iterations) {Array.new(dimensions) {0.0}}

map_smooth = CMapSmooth.new(dimensions)
map_smooth_log = CLog.new("bin/map_smooth.txt", dimensions)
map_smooth_error_log = CLog.new("bin/map_smooth_error.txt", dimensions)

ptr = 0


for t in 0..iterations-1

	t_ = t*0.05
	x = Math.sin(t_*0.31) - Math.cos(t_*0.98456) + Math.cos(-t_*0.341)
	y = Math.sin(-t_*0.2) + Math.cos(t_*0.7) + Math.cos(t_*0.41)

	map[t][0] = x
	map[t][1] = y

	map_log.add(0, map[t][0])
	map_log.add(1, map[t][1])

	if ((t%density) == 0)
		map_smooth.process(map[t], t)

		for i in 0..dimensions-1
			input_points_log.add(i, map[t][i])
		end

	end

	smooth_point = map_smooth.get(t)
	error = 0.0

	for i in 0..dimensions-1
		map_smooth_log.add(i, smooth_point[i])

		error = map[t][i] - smooth_point[i]

		map_smooth_error_log.add(i, error)
	end


end

map_log.save()
input_points_log.save()
map_smooth_log.save()
map_smooth_error_log.save()
