`timescale 1ns / 1ps

// ID: 22201089
// Module  : cpu_tb
// Final testbench: runs the Set 9 Appendix B program (7 instructions).

module cpu_tb;

    reg CLK, RESET;
    wire [7:0] Q;
    wire Z;
    wire [3:0] PC;
    integer n;

    cpu_top uut (
        .CLK(CLK),
        .RESET(RESET),
        .Q(Q),
        .Z(Z),
        .PC(PC)
    );

initial CLK = 0;
    always #5 CLK = ~CLK;

    initial begin
        RESET = 1;
        @(posedge CLK);
        @(posedge CLK);
        #1;
        $display("Cycle 0 | RESET=1 | ACC=%h | Z=%b | ACC_bin=%b | Next PC=%0d", Q, Z, Q, PC);
        RESET = 0;


for (n = 1; n <= 7; n = n + 1) begin
            @(posedge CLK);
            #1;
            $display("Cycle %0d | ACC=%h | Z=%b | ACC_bin=%b | Next PC=%0d", n, Q, Z, Q, PC);
        end
        $finish;
    end

endmodule

