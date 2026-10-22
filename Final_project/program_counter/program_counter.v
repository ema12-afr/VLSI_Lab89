`timescale 1ns / 1ps

// ID: 22201089
// Module  : program_counter
// 4-bit PC. RESET -> 0. If jz and Z=1 then PC <- target, else PC + 1.

module program_counter(
    input CLK,
    input RESET,
    input jz,
    input zin,
    input [3:0] target,
    output reg [3:0] pc
);

    always @(posedge CLK) begin
        if (RESET)
            pc <= 4'b0000;
        else if (jz && zin)
            pc <= target;
        else
            pc <= pc + 1'b1;
    end

endmodule