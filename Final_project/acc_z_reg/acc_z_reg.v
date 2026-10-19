`timescale 1ns / 1ps

// ID: 22201089
// Module  : acc_z_reg
// ACC (8-bit) and Z flag registers. Synchronous active-high RESET: ACC=0, Z=1.

module acc_z_reg(
    input CLK,
    input RESET,
    input acc_we,
    input z_we,
    input [7:0] d_in,
    output reg [7:0] acc,
    output reg z
);

 always @(posedge CLK) begin
        if (RESET) begin
            acc <= 8'h00;
            z   <= 1'b1;
        end else begin
            if (acc_we) acc <= d_in;
            if (z_we)   z   <= (d_in == 8'h00);
        end
    end

endmodule