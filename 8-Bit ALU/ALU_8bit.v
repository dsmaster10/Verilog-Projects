`timescale 1ns / 1ps

module ALU_8bit_tb;

  // Inputs
  reg [2:0] operation;
  reg [7:0] operand_A;
  reg [7:0] operand_B;

  // Outputs
  wire [15:0] result;
  wire carry_flag;
  wire zero_flag;

  ALU_8bit dut (
    .operation(operation), .operand_A(operand_A), .operand_B(operand_B),
    .result(result), .carry_flag(carry_flag), .zero_flag(zero_flag) );

  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  initial begin
    // Test ADD operation
    operation = 3'b000;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("ADD Result: %b, Carry: %b, Zero: %b", result, carry_flag, zero_flag);

    // Test SUB operation
    operation = 3'b001;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("SUB Result: %b, Carry: %b, Zero: %b", result, carry_flag, zero_flag);

    // Test MUL operation
    operation = 3'b010;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("MUL Result: %b, Zero: %b", result, zero_flag);

    // Test AND operation
    operation = 3'b011;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("AND Result: %b, Zero: %b", result, zero_flag);

    // Test OR operation
    operation = 3'b100;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("OR Result: %b, Zero: %b", result, zero_flag);

    // Test NAND operation
    operation = 3'b101;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("NAND Result: %b, Zero: %b", result, zero_flag);

    // Test NOR operation
    operation = 3'b110;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("NOR Result: %b, Zero: %b", result, zero_flag);

    // Test XOR operation
    operation = 3'b111;
    operand_A = 8'b11011010;
    operand_B = 8'b00100111;
    #10;
    $display("XOR Result: %b, Zero: %b", result, zero_flag);

    $finish;
  end

endmodule