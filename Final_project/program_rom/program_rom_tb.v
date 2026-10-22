`timescale 1ns / 1ps

// ID: 22201089
// Module  : program_rom_tb
// Testbench for program_rom. Reads all 16 addresses.

module program_rom_tb;

    reg  [3:0] addr;
    wire [11:0] instr;
    integer i;
	 
	  program_rom uut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            addr = i;
            #10;
            $display("addr=%0d -> instr=%h", addr, instr);
        end
        $finish;
    end

endmodule