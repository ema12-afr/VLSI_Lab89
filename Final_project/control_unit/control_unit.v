`timescale 1ns / 1ps

// ID: 22201089
// Module  : control_unit
// Decodes opcode into ALU select and write/jump enables. Unused opcodes = NOP.

module control_unit(
    input  [3:0] opcode,
    output reg [1:0] alu_sel,
    output reg acc_we,
    output reg z_we,
    output reg jz
);

always @(*) begin
        alu_sel = 2'b00;
        acc_we  = 1'b0;
        z_we    = 1'b0;
        jz      = 1'b0;
		  
		  case (opcode)
            4'b0001: begin alu_sel = 2'b00; acc_we = 1'b1; z_we = 1'b1; end // LDI
            4'b0010: begin alu_sel = 2'b01; acc_we = 1'b1; z_we = 1'b1; end // ADD
            4'b0111: begin alu_sel = 2'b10; acc_we = 1'b1; z_we = 1'b1; end // NOT
				4'b1000: begin alu_sel = 2'b11; acc_we = 1'b1; z_we = 1'b1; end // SHL
            4'b1100: begin jz = 1'b1; end                                   // JZ
            default: ;
        endcase
    end

endmodule