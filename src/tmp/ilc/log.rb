class CLog

	def initialize(file_name, axis_count)
		@log = Array.new(axis_count) {Array.new};
		@file_name = file_name;
	end


	def add(axis, value)
		@log[axis].push(value);
	end


	def save()
		f = File.new(@file_name, "w");
		
		for i in 0..@log[0].size-1
			for j in 0..@log.size-1		
				f.printf("%f\t", @log[j][i]);
			end
			
			f.printf("\n");
		end
	
		f.close();
	end

end