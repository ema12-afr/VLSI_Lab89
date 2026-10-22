`timescale 1ns / 1ps

// ID: 22201089
// Module  : program_rom
// 16 x 12 ROM holding the Set 9 test program. Unused locations = 0x000 (NOP).

module program_rom(
    input  [3:0] addr,
    output reg [11:0] instr
);

    always @(*) begin
        case (addr)
            4'd0:    instr = 12'h1FF; // LDI 0xFF
            4'd1:    instr = 12'h700; // NOT
            4'd2:    instr = 12'hC05; // JZ 0x05
            4'd3:    instr = 12'h277; // ADD 0x77
				4'd4:    instr = 12'h277; // ADD 0x77
            4'd5:    instr = 12'h211; // ADD 0x11
            4'd6:    instr = 12'h800; // SHL
            4'd7:    instr = 12'hC00; // JZ 0x00
            4'd8:    instr = 12'h800; // SHL
            default: instr = 12'h000; // NOP
        endcase
    end

endmodule