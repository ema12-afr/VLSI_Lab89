`timescale 1ns / 1ps

// ID: 22201089
// Module  : not_8bit_tb
// Testbench for not_8bit.

module not_8bit_tb;

    reg  [7:0] a;
    wire [7:0] y;

    not_8bit uut (
        .A0(a[0]), .A1(a[1]), .A2(a[2]), .A3(a[3]),
        .A4(a[4]), .A5(a[5]), .A6(a[6]), .A7(a[7]),
        .Y0(y[0]), .Y1(y[1]), .Y2(y[2]), .Y3(y[3]),
        .Y4(y[4]), .Y5(y[5]), .Y6(y[6]), .Y7(y[7])
    );
	 
	 task check;
        input [7:0] x;
        begin
            a = x;
            #10;
            $display("A=%h -> Y=%h expected=%h %s", a, y, ~x, (y === ~x) ? "PASS" : "FAIL");
        end
    endtask
	 
	 initial begin
        check(8'h00);
        check(8'hFF);
        check(8'h55);
        check(8'hAA);
        check(8'h0F);
        check(8'h11);
        $finish;
    end

endmodule