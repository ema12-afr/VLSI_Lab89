`timescale 1ns / 1ps

// ID: 22201089
// Module  : alu
// Combinational ALU: LDI, ADD, NOT, SHL.

module alu(
    input  [7:0] acc_in,
    input  [7:0] operand,
    input  [1:0] alu_sel,
    output reg [7:0] result
);

wire [7:0] sum;
    wire [7:0] not_out;

    add_8bit adder (
        .A0(acc_in[0]), .A1(acc_in[1]), .A2(acc_in[2]), .A3(acc_in[3]),
        .A4(acc_in[4]), .A5(acc_in[5]), .A6(acc_in[6]), .A7(acc_in[7]),
        .B0(operand[0]), .B1(operand[1]), .B2(operand[2]), .B3(operand[3]),
        .B4(operand[4]), .B5(operand[5]), .B6(operand[6]), .B7(operand[7]),
        .S0(sum[0]), .S1(sum[1]), .S2(sum[2]), .S3(sum[3]),
        .S4(sum[4]), .S5(sum[5]), .S6(sum[6]), .S7(sum[7])
    );
	 
	  not_8bit inverter (
        .A0(acc_in[0]), .A1(acc_in[1]), .A2(acc_in[2]), .A3(acc_in[3]),
        .A4(acc_in[4]), .A5(acc_in[5]), .A6(acc_in[6]), .A7(acc_in[7]),
        .Y0(not_out[0]), .Y1(not_out[1]), .Y2(not_out[2]), .Y3(not_out[3]),
        .Y4(not_out[4]), .Y5(not_out[5]), .Y6(not_out[6]), .Y7(not_out[7])
    );
	 
	 always @(*) begin
        case (alu_sel)
            2'b00:   result = operand;
            2'b01:   result = sum;
            2'b10:   result = not_out;
            2'b11:   result = {acc_in[6:0], 1'b0};
            default: result = 8'h00;
        endcase
    end

endmodule
