class CMapSmooth

    def initialize(dimension)

        @dimension = dimension

        @order = 5

        @point = Array.new(@dimension) {0.0};
        @input_points = Array.new(@order) {Array.new(@dimension) {0.0}}

        @input_points_t = Array.new(@order) {0.0}

    end


    def process(input_point, t)

        for j in 0..@input_points.size-2

            j_last = @input_points.size-1 - j
            j_prev = @input_points.size-2 - j

            for i in 0..@input_points[j].size-1
                @input_points[j_last][i] = @input_points[j_prev][i]
            end

            @input_points_t[j_last] = @input_points_t[j_prev]

        end

        for i in 0..@input_points[0].size-1
            @input_points[0][i] = input_point[i]
        end

        @input_points_t[0] = t
    end

    def get(t, mode = 0)

        v = Array.new(@dimension) {0.0}
        c = Array.new(@dimension) {0.0}

        t_ = t - @input_points_t[0]


        for i in 0..@point.size-1

            #@point[i] = @input_points[0][i]

            v[i] = @input_points[0][i] - @input_points[1][i]
            c[i] = @input_points[1][i]
            @point[i] = v[i]*(0.05*t_/2.0) + c[i]

            #@point[i] = ((1 - t_)**2.0)*@input_points[0][i]
            #@point[i]+= (2.0*t_*(1 - t_))*@input_points[1][i]
            #@point[i]+= (t_**2.0)*@input_points[2][i]
        end

        return @point
    end

end
