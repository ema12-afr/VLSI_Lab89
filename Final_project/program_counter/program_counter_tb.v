`timescale 1ns / 1ps

// ID: 22201089
// Module  : program_counter_tb
// Testbench for program_counter.

module program_counter_tb;

    reg CLK, RESET, jz, zin;
    reg [3:0] target;
    wire [3:0] pc;
    integer i;

    program_counter uut (
        .CLK(CLK),
        .RESET(RESET),
        .jz(jz),
        .zin(zin),
        .target(target),
        .pc(pc)
    );
	 
	 initial CLK = 0;
    always #5 CLK = ~CLK;

    task step;
        input [255:0] label;
        begin
            @(posedge CLK);
            #1;
            $display("%0s: jz=%b Z=%b target=%0d -> PC=%0d", label, jz, zin, target, pc);
        end
    endtask
	 
	 initial begin
        RESET = 1; jz = 0; zin = 0; target = 4'd0;
        step("reset          ");
        RESET = 0;
        step("count          ");
        step("count          ");
        step("count          ");
        jz = 1; zin = 1; target = 4'd5;
        step("jump taken     ");
        jz = 1; zin = 0; target = 4'd0;
        step("jump not taken ");
        jz = 0; zin = 0;
        for (i = 0; i < 10; i = i + 1)
            step("count          ");
        $finish;
    end

endmodule