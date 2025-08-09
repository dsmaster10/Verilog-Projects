`timescale 1ns / 1ps
module sipo_sr_tb;

	// Inputs
	reg clk;
	reg data_in;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	sipo_sr uut (
		.clk(clk), 
		.data_in(data_in), 
		.reset(reset), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #5 clk=~clk;
        
		// Add stimulus here
	end
	initial begin
		reset=1; data_in=0;
		#12 reset=0;
		#3 data_in=1;
		#10 data_in=0;
		#5 data_in=1;
		#7 data_in=1;
		#15 $stop;
	end
	initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | data_in=%b | q=%b", 
                 $time, clk, reset, data_in, q);
    end
      
endmodule

