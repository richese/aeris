class CLog
	
	def initialize(txt_file_name, set_count)
		@txt_file = txt_file_name;


		@data = Array.new(set_count) {Array.new()};
		@ptr = Array.new(set_count);
		
		for i in 0..@ptr.size-1
			@ptr[i] = 0;
		end
		
		
		@idx = 0;
		
		max = 10.99**10;
		
		@max_x = -max;
		@min_x = max;
		
		@max_y = -max;
		@min_y = max;
	end
	
	
	def add(idx, value)
		ptr = @ptr[idx];
		@data[idx][ptr] = value;		
		@ptr[idx] = ptr+1;
		
		if (idx > @max_x)
			@max_x = idx;
		end
		
		if (idx!=0)
			if (value > @max_y)
				@max_y = value;
			end
			
			if (value < @min_y)
				@min_y = value;
			end
		end
	end

	def save_txt()
		
		#save log as txt file
		f = File.new(@txt_file, "w");
		
		for i in 0..@data[0].size-1
			for j in 0..@data.size-1		
				f.printf("%f\t", @data[j][i]);
			end
			
			f.printf("\n");
		end
	
		f.close();
	end
		
	
	def save()
		save_txt();
	end
	
	
end