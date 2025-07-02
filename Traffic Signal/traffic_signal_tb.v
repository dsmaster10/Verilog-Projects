`timescale 1ns / 1ps

module traffic_signal_tb();

reg clk;
reg reset;

wire red;
wire yellow;
wire green;

traffic_signal dut( .clk(clk), .reset(reset), .red(red), .yellow(yellow),
  .green(green) );

always #5 clk = ~clk; 

initial begin
  clk = 0;
  reset = 1;
  #10 reset = 0;

  #100 $finish;
end

always @(posedge clk) begin
  $display("RED=%b YELLOW=%b GREEN=%b", red, yellow, green);
end

endmodule