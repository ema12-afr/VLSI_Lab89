`timescale 1ns / 1ps

// ID: 22201089
// Module  : acc_z_reg_tb
// Testbench for acc_z_reg.

module acc_z_reg_tb;

    reg CLK, RESET, acc_we, z_we;
    reg [7:0] d_in;
    wire [7:0] acc;
    wire z;

    acc_z_reg uut (
        .CLK(CLK),
        .RESET(RESET),
        .acc_we(acc_we),
        .z_we(z_we),
        .d_in(d_in),
        .acc(acc),
        .z(z)
    );
	 
	 initial CLK = 0;
    always #5 CLK = ~CLK;

    task step;
        input [255:0] label;
        begin
            @(posedge CLK);
            #1;
            $display("%0s: ACC=%h Z=%b", label, acc, z);
        end
    endtask
	 
	 initial begin
        RESET = 1; acc_we = 0; z_we = 0; d_in = 8'h00;
        step("reset          ");
        RESET = 0; acc_we = 1; z_we = 1; d_in = 8'hFF;
        step("write FF       ");
        d_in = 8'h00;
        step("write 00       ");
        d_in = 8'h5A;
        step("write 5A       ");
        acc_we = 0; z_we = 0; d_in = 8'h00;
        step("hold (we=0)    ");
        RESET = 1;
        step("reset again    ");
        $finish;
    end

endmodule