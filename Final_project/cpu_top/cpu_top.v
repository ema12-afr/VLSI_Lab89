`timescale 1ns / 1ps

// ID: 22201089
// Module  : cpu_top
// Top level of the Mini 8-bit Accumulator CPU (LDI, ADD, NOT, SHL, JZ).

module cpu_top(
    input CLK,
    input RESET,
    output [7:0] Q,
    output Z,
    output [3:0] PC
);

    wire [11:0] instr;
    wire [1:0]  alu_sel;
    wire        acc_we, z_we, jz;
    wire [7:0]  alu_result;

    program_counter pc_inst (
        .CLK(CLK),
        .RESET(RESET),
        .jz(jz),
        .zin(Z),
        .target(instr[3:0]),
        .pc(PC)
    );
	 
	 program_rom rom_inst (
        .addr(PC),
        .instr(instr)
    );

    control_unit cu_inst (
        .opcode(instr[11:8]),
        .alu_sel(alu_sel),
        .acc_we(acc_we),
        .z_we(z_we),
        .jz(jz)
    );

    alu alu_inst (
        .acc_in(Q),
        .operand(instr[7:0]),
        .alu_sel(alu_sel),
        .result(alu_result)
    );
	 
	 acc_z_reg reg_inst (
        .CLK(CLK),
        .RESET(RESET),
        .acc_we(acc_we),
        .z_we(z_we),
        .d_in(alu_result),
        .acc(Q),
        .z(Z)
    );

endmodule