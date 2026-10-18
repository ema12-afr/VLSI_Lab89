`timescale 1ns / 1ps

// ID: 22201089
// Module  : alu_tb
// Testbench for alu.

module alu_tb;

    reg  [7:0] acc_in, operand;
    reg  [1:0] alu_sel;
    wire [7:0] result;

    alu uut (
        .acc_in(acc_in),
        .operand(operand),
        .alu_sel(alu_sel),
        .result(result)
    );
	 
	  task check;
        input [1:0] sel;
        input [7:0] a;
        input [7:0] op;
        input [7:0] exp;
        begin
            alu_sel = sel;
            acc_in  = a;
            operand = op;
            #10;
            $display("sel=%b ACC=%h OP=%h -> result=%h expected=%h %s", sel, a, op, result, exp, (result === exp) ? "PASS" : "FAIL");
        end
    endtask


 initial begin
        // LDI
        check(2'b00, 8'h12, 8'hAB, 8'hAB);
        check(2'b00, 8'hFF, 8'h00, 8'h00);
        // ADD
        check(2'b01, 8'h77, 8'h77, 8'hEE);
        check(2'b01, 8'hFF, 8'h01, 8'h00);
        check(2'b01, 8'h00, 8'h11, 8'h11);
        // NOT
		  check(2'b10, 8'hFF, 8'h00, 8'h00);
        check(2'b10, 8'h55, 8'h00, 8'hAA);
        // SHL
        check(2'b11, 8'h11, 8'h00, 8'h22);
        check(2'b11, 8'h22, 8'h00, 8'h44);
        check(2'b11, 8'h80, 8'h00, 8'h00);
        $finish;
    end

endmodule