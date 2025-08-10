`timescale 1ns / 1ps
module piso_sr(
input clk,
input load,
input reset,
input shift_en,
input [3:0] data_in,
output serial_out
);
reg[3:0] shift_reg; //internal register for storage

always @(posedge clk ) begin
    if(reset)begin
        shift_reg<=4'b0000; //only reset signal means output =
    end
    else if(load)begin
        shift_reg<=data_in; // it means data loaded
    end
    else if(shift_en)begin
        shift_reg  <= {1'b0, shift_reg[3:1]};  // right shift with 0 fill msb
    end
end 

assign serial_out=reset?1'b0:shift_reg[0];
endmodule