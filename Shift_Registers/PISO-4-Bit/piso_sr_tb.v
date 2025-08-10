`timescale 1ns / 1ps
module piso_sr_tb;

	// Inputs
	reg clk;
	reg load;
	reg reset;
	reg shift_en;
	reg [3:0] data_in;

	// Outputs
	wire serial_out;

	// Instantiate the Unit Under Test (UUT)
	piso_sr uut (
		.clk(clk), 
		.load(load), 
		.reset(reset), 
		.shift_en(shift_en), 
		.data_in(data_in), 
		.serial_out(serial_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		load = 0;
		reset = 0;
		shift_en = 0;
		data_in = 0;
		forever #5clk=~clk;  
	end 
		// Add stimulus here
		initial begin
	
			$monitor($time, " clk=%b load=%b shift_en=%b data_in=%b serial_out=%b", clk, load, shift_en, data_in, serial_out);

		//reset pulse
			reset=1;
			#10 reset=0; 
			
			// loading 
			#10 load=1;
			shift_en=0;
			data_in=4'b1101;
			
			// shifting
			#10 load=0;
			shift_en=1;
			
	#100 $finish;

	end
      
endmodule

