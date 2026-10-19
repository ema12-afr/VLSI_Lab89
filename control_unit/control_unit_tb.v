`timescale 1ns / 1ps

// ID: 22201089
// Module  : control_unit_tb
// Testbench for control_unit. Tries all 16 opcodes.

module control_unit_tb;

    reg  [3:0] opcode;
    wire [1:0] alu_sel;
    wire acc_we, z_we, jz;
    integer i;
	 
	 control_unit uut (
        .opcode(opcode),
        .alu_sel(alu_sel),
        .acc_we(acc_we),
        .z_we(z_we),
        .jz(jz)
    );

initial begin
        for (i = 0; i < 16; i = i + 1) begin
            opcode = i;
            #10;
            $display("opcode=%b alu_sel=%b acc_we=%b z_we=%b jz=%b", opcode, alu_sel, acc_we, z_we, jz);
        end
        $finish;
    end

endmodule